###
global angular, window, cordova, StatusBar
###
(->
  "use strict"
  run = ($ionicPlatform) ->
    $ionicPlatform.ready ->
      if window.cordova.plugins.Keyboard?
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar true
        cordova.plugins.Keyboard.disableScroll true
      if window.StatusBar
        StatusBar.styleLightContent()
      return
    return

  angular
  .module("starter", ["ionic", "tabSlideBox"])
  .run(run)
)()
