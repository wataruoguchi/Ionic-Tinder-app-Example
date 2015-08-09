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
      .state "tab.chat-detail", {
        url: "/chats/:chatId"
        views: {
          "tab-chats": {
            templateUrl: "templates/chat-detail.html"
            controller: "ChatDetailCtrl"
          }
        }
      }

    $urlRouterProvider.otherwise "/tab/dash"
    return

  angular
  .module("starter")
  .config(config)
)()
