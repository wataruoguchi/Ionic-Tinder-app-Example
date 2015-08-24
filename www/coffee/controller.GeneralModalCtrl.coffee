(->
  "use strict"
  ###
  # GeneralModalCtrl is a controller of Modals which have no link/button except close.
  ###
  GeneralModalCtrl = ->
    # Use ViewModel instead of $scope.
    vm = @

    # Close the modal.
    vm.closeThisModal = ->
      vm.closeModal(null)
      return

    return

  angular
    .module("starter")
    .controller("GeneralModalCtrl", GeneralModalCtrl)
)()
