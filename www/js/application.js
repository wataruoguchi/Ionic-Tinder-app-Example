
/*
global angular, window, cordova, StatusBar
 */
(function() {
  "use strict";
  var run;
  run = function($ionicPlatform) {
    $ionicPlatform.ready(function() {
      if (window.cordova.plugins.Keyboard != null) {
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
        cordova.plugins.Keyboard.disableScroll(true);
      }
      if (window.StatusBar) {
        StatusBar.styleLightContent();
      }
    });
  };
  return angular.module("starter", ["ionic", "tabSlideBox"]).run(run);
})();

(function() {
  "use strict";
  var AccountCtrl, ChatDetailCtrl, ChatsCtrl, DashCtrl;
  DashCtrl = function() {};
  ChatsCtrl = function(Chats) {
    var vm;
    vm = this;
    vm.chats = Chats.all();
    vm.remove = function(chat) {
      Chats.remove(chat);
    };
  };
  ChatDetailCtrl = function($stateParams, Chats) {
    var vm;
    vm = this;
    vm.chat = Chats.get($stateParams.chatId);
  };
  AccountCtrl = function() {
    var vm;
    vm = this;
    vm.settings = {
      enableFriends: true
    };
  };
  return angular.module("starter").controller("DashCtrl", DashCtrl).controller("ChatsCtrl", ChatsCtrl).controller("ChatDetailCtrl", ChatDetailCtrl).controller("AccountCtrl", AccountCtrl);
})();

(function() {
  "use strict";
  var config;
  config = function($stateProvider, $urlRouterProvider) {
    $stateProvider.state("tab", {
      url: "/tab",
      abstract: true,
      templateUrl: "templates/tabSlideBox.html"
    }).state("tab.dash", {
      url: "/dash",
      views: {
        "tab-dash": {
          templateUrl: "templates/tab-dash.html",
          controller: "DashCtrl"
        },
        "tab-chats": {
          templateUrl: "templates/tab-chats.html",
          controller: "ChatsCtrl"
        },
        "tab-account": {
          templateUrl: "templates/tab-account.html",
          controller: "AccountCtrl"
        }
      }
    }).state("tab.chat-detail", {
      url: "/chats/:chatId",
      views: {
        "tab-chats": {
          templateUrl: "templates/chat-detail.html",
          controller: "ChatDetailCtrl"
        }
      }
    });
    $urlRouterProvider.otherwise("/tab/dash");
  };
  return angular.module("starter").config(config);
})();

(function() {
  "use strict";
  var Chats;
  Chats = function() {
    var chats;
    chats = [
      {
        id: 0,
        name: "Ben Sparrow",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 1,
        name: "Ben Sparrow",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 2,
        name: "Ben Sparrow",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 3,
        name: "Ben Sparrow",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 4,
        name: "Ben Sparrow",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }
    ];
    return {
      all: function() {
        return chats;
      },
      remove: function(chat) {
        chats.splice(chats.indexOf(chat), 1);
      },
      get: function(chatId) {
        var i, j, ref;
        for (i = j = 0, ref = chats.length - 1; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
          if (chats[i].id === parseInt(chatId)) {
            return chats[i];
          }
        }
        return null;
      }
    };
  };
  return angular.module("starter").factory("Chats", Chats);
})();
