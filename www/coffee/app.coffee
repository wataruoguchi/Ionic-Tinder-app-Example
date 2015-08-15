###
global angular, window, cordova, StatusBar
###
(->
  "use strict"
  run = ($ionicPlatform, ngFB) ->
    ngFB.init {appId: "1456006074706877"}

    $ionicPlatform.ready ->
      if window.cordova? and window.cordova.plugins? and window.cordova.plugins.Keyboard?
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar true
        cordova.plugins.Keyboard.disableScroll true
      if window.StatusBar
        StatusBar.styleLightContent()
      return
    return

  angular
  .module("starter", ["ionic", "tabSlideBox", "ionic.contrib.ui.tinderCards", "ionic.ui.modalService", "ngOpenFB"])
  .run(run)
)()
