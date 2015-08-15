(->
  "use strict"
  DashCtrl = ->
    return

  ChatsCtrl = (Chats) ->
    # Use ViewModel instead of scope
    vm = @
    vm.chats = Chats.all()
    vm.remove = (chat) ->
      Chats.remove chat
      return
    return

  ChatDetailCtrl = ($stateParams, Chats) ->
    vm = @
    vm.chat = Chats.get $stateParams.chatId
    return

  AccountCtrl = ->
    vm = @
    vm.settings = {
      enableFriends: true
    }
    return

  TinderCtrl = (Cards, TDCardDelegate, $ionicSlideBoxDelegate, Modals) ->
    disableSwipe = ->
      $ionicSlideBoxDelegate.enableSlide(false)
      return

    enableSwipe = ->
      $ionicSlideBoxDelegate.enableSlide(true)
      return

    cardIsLiked = (index) ->
      console.log "LIKE!" + index
      return

    cardIsDisliked = (index) ->
      console.log "NOPE" + index
      return

    vm = @
    vm.cards  = Cards.all()

    vm.onTouch = ->
      disableSwipe()
      return

    vm.onRelease = ->
      enableSwipe()
      return

    vm.cardDestroyed = (index) ->
      vm.cards.splice index, 1
      return

    vm.cardSwipedLeft = (index) ->
      cardIsDisliked(index)
      return

    vm.cardSwipedRight = (index) ->
      cardIsLiked(index)
      return

    vm.cardTapNo = ->
      cardIsDisliked(0)
      vm.cardDestroyed(0)
      return

    vm.cardTapYes = ->
      cardIsLiked(0)
      vm.cardDestroyed(0)
      return

    vm.openCardModal = (card) ->
      if card
        Modals.showCardItem(card)
        .then(
          (card) ->
            vm.card = card
        )
      return

    vm.closeCardModal = (result) ->
      if result
        vm.closeModal(result)
      return

    return

  TinderModalCtrl = (parameters) ->
    vm = @
    vm.card = parameters

    vm.closeCardModal = (result) ->
      if result
        vm.closeModal(result)
      return

    return

  SigninCtrl = ($state, Modals, $timeout, ngFB) ->
    vm = @
    vm.activeSlide = 0

    vm.openTermModal = () ->
      Modals.showTerm()
      return

    vm.openPrivacyModal = () ->
      Modals.showPrivacy()
      return

    vm.signInWithFacebook = ()->
      ngFB.login({scope: "email,user_friends,publish_actions"}).then((response) ->
        if response.status is "connected"
          console.log "FB login succeeded"
          $state.go("tab.dash")
        else
          console.log "FB login failed"
        return
      )
      return

    vm.signInWithTwitter = ()->
      $state.go("tab.dash")
      return

    return

  GeneralModalCtrl = () ->
    vm = @
    vm.closeThisModal = ->
      vm.closeModal(null)
      return

    return

  angular
    .module("starter")
    .controller("DashCtrl", DashCtrl)
    .controller("TinderCtrl", TinderCtrl)
    .controller("TinderModalCtrl", TinderModalCtrl)
    .controller("ChatsCtrl", ChatsCtrl)
    .controller("ChatDetailCtrl", ChatDetailCtrl)
    .controller("AccountCtrl", AccountCtrl)
    .controller("SigninCtrl", SigninCtrl)
    .controller("GeneralModalCtrl", GeneralModalCtrl)
)()
