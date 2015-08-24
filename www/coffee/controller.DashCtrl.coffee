(->
  "use strict"
  ###
  # DashCtrl is a controller of Dashboard tab.
  # Click user's photo to Sign out.
  # Click "Discovery Preferences" to see preferences settings(It has only appearance)
  # Click "App Settings", it shows a blank modal.
  # Click "Need Help?" doesn't do anything.
  # Click "Share Tinder" doesn't do anything.
  ###
  DashCtrl = ($q, $state, localStorageService, Modals, FacebookAPI) ->
    # Use ViewModel instead of $scope.
    vm = @
    vm.profileData = {
      name: ""
      pictureUrl: ""
    }

    # Invoked by ng-init. Loads profile photo and name from FB.
    vm.init = ->
      if localStorageService.hasOwnProperty("accessToken")
        $q.all([FacebookAPI.getProfileName(), FacebookAPI.getProfilePicture()])
        .then((results) ->
          vm.profileData.name = results[0]
          vm.profileData.pictureUrl = results[1]
        )
      else
        $state.go("signin")
      return

    # Opens profile modal.
    vm.openProfileModal = ->
      Modals.showProfile()
      return

    # Opens preferences modal.
    vm.openPrefModal = ->
      Modals.showPreferences()
      return

    # Opens settings modal.
    vm.openSettingsModal = ->
      Modals.showSettings()
      return

    vm.openHelp = ->
      #Nothing has been made.
      return

    vm.openShare = ->
      #Nothing has been made.
      return

    return

  angular
    .module("starter")
    .controller("DashCtrl", DashCtrl)
)()
