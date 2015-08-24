(->
  "use strict"
  ###
  # SigninCtrl is a controller of sign in page.
  # Loaded PrivateData is just an object which has facebookAppID and fakeAccessToken.
  ###
  SigninCtrl = ($state, $cordovaOauth, localStorageService, Modals, PrivateData) ->
    # Use ViewModel instead of $scope.
    vm = @
    vm.activeSlide = 0

    # Show term of service.
    vm.openTermModal = ->
      Modals.showTerm()
      return

    # Show privacy policy.
    vm.openPrivacyModal = ->
      Modals.showPrivacy()
      return

    # Signin with Facebook.
    # On browser debugging you can not use ngCordava and $cordovaOauth.
    vm.signInWithFB = ->
      if window.cordova? and window.cordova.plugins? and window.cordova.plugins.Keyboard?
        # For debugging with cordova
        $cordovaOauth.facebook(PrivateData.facebookAppID, ["email", "user_posts", "user_photos", "user_friends", "read_custom_friendlists", "user_website", "user_location", "user_relationships"])
        .then((result) ->
          localStorageService.accessToken = result.access_token
          console.log "access token is [" + result.access_token + "]"
          $state.go("tab.dash")
          return
        (error) ->
          console.log "error at signInWithFB"
          return
        )
      else
        # For debugging without cordova
        localStorageService.accessToken = PrivateData.fakeAccessToken
        $state.go("tab.dash")
      return

    return

  angular
    .module("starter")
    .controller("SigninCtrl", SigninCtrl)
)()
