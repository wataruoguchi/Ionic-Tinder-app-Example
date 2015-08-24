# Loading modules. Those modules are all smart!

(->
  "use strict"
  run = ($ionicPlatform) ->

    $ionicPlatform.ready ->
      if window.cordova? and window.cordova.plugins? and window.cordova.plugins.Keyboard?
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar true
        cordova.plugins.Keyboard.disableScroll true
      if window.StatusBar
        StatusBar.styleLightContent()
      return
    return

  angular
  .module("starter", ["ionic", "tabSlideBox", "ionic.contrib.ui.tinderCards", "ionic.ui.modalService", "ngCordova", "LocalStorageModule"])
  .run(run)
)()
