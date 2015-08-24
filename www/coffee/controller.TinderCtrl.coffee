(->
  "use strict"
  ###
  # TinderCtrl is a controller of Tinder tab.
  # Loads photos from FB, and shows the photos.
  # This is just an example, doesn't do anything when user swipe YES or NONE.
  # So sorry, you can not find a partner with it :P
  ###
  TinderCtrl = ($q, $state, $ionicSlideBoxDelegate, TDCardDelegate, localStorageService, Modals, FacebookAPI) ->
    # Use ViewModel instead of $scope.
    vm = @
    vm.albums = []  # Is album IDs from FB.
    vm.photos = []  # Is photo IDs from FB. It doesn't show up on the View.
    vm.cards = [] #Has maximum 5 photos from FB.

    # Invoked by ng-init.
    vm.init = ->
      if localStorageService.hasOwnProperty("accessToken")
        console.log "tinder_ access token is [" + localStorageService.accessToken + "]"
        getFBalbums()
      else
        $state.go("signin")
      return

    # Disable swiping tabs when user tabs a card.
    disableSwipe = ->
      $ionicSlideBoxDelegate.enableSlide(false)
      return

    # Enable swiping tabs when user leave a card.
    enableSwipe = ->
      $ionicSlideBoxDelegate.enableSlide(true)
      return

    cardIsLiked = () ->
      console.log "LIKE!"
      return

    cardIsDisliked = () ->
      console.log "NOPE!"
      return

    # Invoked by on-touch.
    vm.onTouch = ->
      disableSwipe()
      return

    # Invoked by on-release.
    vm.onRelease = ->
      enableSwipe()
      return

    # Invoked by on-destroy. Remove a card and make a card from a photo.
    vm.cardDestroyed = (index) ->
      vm.cards.splice index, 1
      setCardsFromPhotos()
      return

    # Invoked by on-swipe-left.
    vm.cardSwipedLeft = (index) ->
      console.log "index: " + index
      cardIsDisliked()
      return

    # Invoked by on-swipe-right.
    vm.cardSwipedRight = (index) ->
      console.log "index: " + index
      cardIsLiked()
      return

    # Invoked by a button.
    vm.cardTapNo = (index) ->
      cardIsDisliked()
      vm.cardDestroyed(index)
      return

    # Invoked by a button.
    vm.cardTapYes = (index) ->
      cardIsLiked()
      vm.cardDestroyed(index)
      return

    # Show a modal when a card is tapped.
    vm.openCardModal = (card) ->
      if card
        Modals.showCardItem(card)
      return

    # vm.cards array is FILO.
    # Ex.)
    # ["lion", "elephant", "zebra"] (User can see "Zebra" on top of cards)
    # When user swipes "zebra"...
    # ["lion", "elephant"]
    # This function does...
    # ["rabbit", "lion", "elephant"]
    # "rabbit" comes from vm.photos[0]
    setCardsFromPhotos = ->
      vm.cards.unshift(vm.photos[0])
      vm.photos.splice 0, 1
      getFBphotos()
      return

    # Get photos by album id.
    # Photos are stacking into vm.photos.
    getFBphotosByAlbum = (album) ->
      FacebookAPI.getPhotosByAlbum(album).then((result) ->
        photos = result
        for photo in photos
          photo.url = FacebookAPI.getPhotoURL(photo)
          vm.photos.push photo
        if vm.cards.length is 0
          setInitialCards()
      )

    # Get photos only when the number of photo stack is less than 4.
    # And if there is an album ID in vm.albums.
    # Why 4? Because it's less than 5 which is the number of cards.
    getFBphotos = ->
      if vm.photos.length < 4
        if vm.albums.length > 0
          getFBphotosByAlbum(vm.albums[0])
          vm.albums.splice 0, 1
      return

    # Load initial cards. The number of card is 5.
    setInitialCards = ->
      for [0..4]
        if vm.photos[0]?
          vm.cards.push vm.photos[0]
          vm.photos.splice 0, 1
      return

    # Get album IDs, then get photos.
    getFBalbums = ->
      FacebookAPI.getAlbums().then((result) ->
        vm.albums = result
        getFBphotos()
        return
      )
      return

    return

  angular
    .module("starter")
    .controller("TinderCtrl", TinderCtrl)
)()
