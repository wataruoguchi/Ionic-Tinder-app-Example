(->
  "use strict"
  ###
  # FeedListCtrl is a controller of feed list tab.
  ###
  FeedListCtrl = ($q, $scope, $state, localStorageService, FacebookAPI) ->
    # Use ViewModel instead of $scope.
    vm = @

    # Invoked by ng-init. Loads profile photo and feed from FB.
    vm.init = ->
      if localStorageService.hasOwnProperty("accessToken")
        $q.all([FacebookAPI.getFeed(), FacebookAPI.getProfilePicture()])
        .then((results) ->
          vm.feedData = results[0]
          vm.feedData.myPicture = results[1]
          return
        )
      else
        $state.go("signin")
      return

    # When accessToken is set, invoke vm.init() again.
    $scope.$watch(->
      localStorageService.accessToken
    ->
      vm.init()
      return
    )

    return

  angular
    .module("starter")
    .controller("FeedListCtrl", FeedListCtrl)
)()
