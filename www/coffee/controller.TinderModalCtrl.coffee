(->
  "use strict"
  ###
  # TinderModalCtrl is a controller of Tinder card modal.
  # Tinder card modal shows a photo and photo-id.
  # This is just an example of modal with parameters.
  ###
  TinderModalCtrl = (parameters) ->
    # Use ViewModel instead of $scope.
    vm = @
    vm.card = parameters

    # Close the modal.
    vm.closeCardModal = ->
      vm.closeModal(null)
      return

    return

  angular
    .module("starter")
    .controller("TinderModalCtrl", TinderModalCtrl)
)()
