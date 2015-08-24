(->
  "use strict"
  ###
  # localStorage keeps facebook's accessToken.
  # App can access to accessToken anywhere through this.
  ###
  localStorage = (localStorageServiceProvider) ->
    localStorageServiceProvider.setPrefix("myApp")
    localStorageServiceProvider.setStorageType("sessionStorage")
    return

  return

  angular
  .module("starter")
  .config(localStorage)
)()
