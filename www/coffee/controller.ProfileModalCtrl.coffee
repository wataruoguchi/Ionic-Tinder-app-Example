(->
  "use strict"
  ###
  # ProfileModalCtrl is a controller of Profile Modal.
  # It only has close modal button and sign out(log out) button.
  ###
  ProfileModalCtrl = ($state, parameters) ->
    # Use ViewModel instead of $scope.
    vm = @

    # Close the modal.
    vm.closeThisModal = ->
      vm.closeModal(null)
      return

    # Logout.
    vm.logout = ->
      $state.go("signin")
      vm.closeModal(null)
      return

    return

  angular
    .module("starter")
    .controller("ProfileModalCtrl", ProfileModalCtrl)
)()
