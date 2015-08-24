(->
  "use strict"
  config = ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "signin", {
        url: "/signin"
        templateUrl: "templates/sign-in.html"
        controller: "SigninCtrl"
      }
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
          "tab-feed-list": {
            templateUrl: "templates/tab-feed-list.html"
            controller: "FeedListCtrl"
          }
        }
      }
      # .state "settings", {
      #   url: "/nav"
      #   abstract: true
      #   templateUrl: "templates/navigation.html"
      # }
      # .state "settings.settings", {
      #   url: "/settings"
      #   templateUrl: "templates/settings.html"
      # }
      # .state "settings.term", {
      #   url: "/term"
      #   templateUrl: "templates/term-of-service.html"
      # }
      # .state "settings.privacy", {
      #   url: "/privacy"
      #   templateUrl: "templates/privacy-policy.html"
      # }

    $urlRouterProvider.otherwise "/tab/dash"
    return

  angular
  .module("starter")
  .config(config)
)()
