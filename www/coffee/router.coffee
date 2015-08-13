(->
  "use strict"
  config = ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "tab", {
        url: "/tab"
        abstract: true
        templateUrl: "templates/tabSlideBox.html"
      }
      .state "tab.dash", {
        url: "/dash"
        views: {
          "tab-dash": {
            templateUrl: "templates/tab-dash.html"
            controller: "DashCtrl"
          }
          "tab-tinder": {
            templateUrl: "templates/tab-tinder.html"
            controller: "TinderCtrl"
          }
          "tab-chats": {
            templateUrl: "templates/tab-chats.html"
            controller: "ChatsCtrl"
          }
          "tab-account": {
            templateUrl: "templates/tab-account.html"
            controller: "AccountCtrl"
          }
        }
      }

    $urlRouterProvider.otherwise "/tab/dash"
    return

  angular
  .module("starter")
  .config(config)
)()
