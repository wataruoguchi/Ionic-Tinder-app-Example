(->
  "use strict"
  ###
  # FeedListCtrl is a controller of feed list tab.
  ###
  FeedListCtrl = ($q, $state, localStorageService, FacebookAPI) ->
    # Use ViewModel instead of $scope.
    vm = @

    # Invoked by ng-init. Loads profile photo and feed from FB.
    vm.init = ->
      if localStorageService.hasOwnProperty("accessToken")
        console.log "feed_ access token is [" + localStorageService.accessToken + "]"
        $q.all([FacebookAPI.getFeed(), FacebookAPI.getProfilePicture()])
        .then((results) ->
          vm.feedData = results[0]
          vm.feedData.myPicture = results[1]
          return
        )
      else
        $state.go("signin")
      return
    return

  angular
    .module("starter")
    .controller("FeedListCtrl", FeedListCtrl)
)()
