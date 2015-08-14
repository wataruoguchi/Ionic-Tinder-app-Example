###
# Reference
# http://codepen.io/julianpaulozzi/pen/wBgpjM?editors=101
###
(->
  "use strict"
  appModalService = ($ionicModal, $rootScope, $q, $injector, $controller) ->
    show = (templateUrl, controller, parameters, options) ->
      deferred = $q.defer()
      modalScope = $rootScope.$new()
      thisScopeId = modalScope.$id
      defaultOptions = {
        animation: "slide-in-up"
        focusFirstInput: false
        backdropClickToClose: true
        hardwareBackButtonClose: true
        modalCallback: null
      }
      options = angular.extend({}, defaultOptions, options)
      $ionicModal.fromTemplateUrl(templateUrl, {
        scope: modalScope
        animation: options.animation
        focusFirstInput: options.focusFirstInput
        backdropClickToClose: options.backdropClickToClose
        hardwareBackButtonClose: options.hardwareBackButtonClose
      }).then((modal) ->
        modalScope.modal = modal
        modalScope.openModal = ->
          modalScope.modal.show()
          return
        modalScope.closeModal = (result) ->
          deferred.resolve(result)
          modalScope.modal.hide()
          return
        modalScope.$on("modal.hidden", (thisModal) ->
          if thisModal.currentScope
            modalscopeId = thisModal.currentScope.$id
            if thisScopeId is modalscopeId
              _clearnup thisModal.currentScope
          return
        )

        locals = {
          "$scope": modalScope
          "parameters": parameters
        }
        ctrlEval = _evalController controller
        ctrlInstance = $controller controller, locals
        if ctrlEval.isControllerAs
          ctrlInstance.openModal = modalScope.openModal
          ctrlInstance.closeModal = modalScope.closeModal
        modalScope.modal.show().then(->
          modalScope.$broadcast "modal.afterShow", modalScope.modal
          return
        )
        if angular.isFunction options.modalCallback
          options.modalCallback modal
          return
      ,(err) ->
        deferred.reject err
        return
      )
      return deferred.promise

    _clearnup = (scope) ->
      scope.$destroy()
      if scope.modal
        scope.modal.remove()
      return

    _evalController = (ctrlName) ->
      result = {
        isControllerAs: false
        controllerName: ""
        propName: ""
      }
      fragments = (ctrlName || "").trim().split(/\s+/)
      result.isControllerAs = fragments.length is 3 and (fragments[1] || "").toLowerCase() is "as"
      if result.isControllerAs
        result.controllerName = fragments[0]
        result.propName = fragments[2]
      else
        result.controllerName = ctrlName
      return result

    {show: show}


  angular
  .module("starter")
  .factory("appModalService", ["$ionicModal", "$rootScope", "$q", "$injector", "$controller", appModalService])
)()
