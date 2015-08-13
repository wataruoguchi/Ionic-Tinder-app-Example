
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
  return angular.module("starter", ["ionic", "tabSlideBox", "ionic.contrib.ui.tinderCards"]).run(run);
})();

(function() {
  "use strict";
  var AccountCtrl, ChatDetailCtrl, ChatsCtrl, DashCtrl, TinderCtrl;
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
  TinderCtrl = function(Cards, TDCardDelegate, $ionicSlideBoxDelegate) {
    var cardIsDisliked, cardIsLiked, disableSwipe, enableSwipe, vm;
    disableSwipe = function() {
      $ionicSlideBoxDelegate.enableSlide(false);
    };
    enableSwipe = function() {
      $ionicSlideBoxDelegate.enableSlide(true);
    };
    cardIsLiked = function(index) {
      console.log("LIKE!" + index);
    };
    cardIsDisliked = function(index) {
      console.log("NOPE" + index);
    };
    vm = this;
    vm.cards = Cards.all();
    vm.onTouch = function() {
      disableSwipe();
    };
    vm.onRelease = function() {
      enableSwipe();
    };
    vm.cardDestroyed = function(index) {
      vm.cards.splice(index, 1);
    };
    vm.cardSwiped = function(index) {};
    vm.cardSwipedLeft = function(index) {
      cardIsDisliked(index);
    };
    vm.cardSwipedRight = function(index) {
      cardIsLiked(index);
    };
  };
  return angular.module("starter").controller("DashCtrl", DashCtrl).controller("TinderCtrl", TinderCtrl).controller("ChatsCtrl", ChatsCtrl).controller("ChatDetailCtrl", ChatDetailCtrl).controller("AccountCtrl", AccountCtrl);
})();

(function() {
  "use strict";
  var noScroll;
  noScroll = function() {
    return {
      restrict: "E",
      link: function($scope, $element, $attr) {
        $element.on("touchmove", function(e) {
          e.preventDefault();
        });
      }
    };
  };
  return angular.module("starter").directive("tdCard", noScroll);
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
        "tab-tinder": {
          templateUrl: "templates/tab-tinder.html",
          controller: "TinderCtrl"
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
    });
    $urlRouterProvider.otherwise("/tab/dash");
  };
  return angular.module("starter").config(config);
})();

(function() {
  "use strict";
  var Cards, Chats;
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
        name: "Ben Sparrow1",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 2,
        name: "Ben Sparrow2",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 3,
        name: "Ben Sparrow3",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 4,
        name: "Ben Sparrow4",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 5,
        name: "Ben Sparrow5",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 6,
        name: "Ben Sparrow6",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 7,
        name: "Ben Sparrow7",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 8,
        name: "Ben Sparrow8",
        lastText: "You on your way?",
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }, {
        id: 9,
        name: "Ben Sparrow9",
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
  Cards = function() {
    var cards;
    cards = [
      {
        img: "img/ionic.png"
      }, {
        img: "img/ionic.png"
      }, {
        img: "img/ionic.png"
      }
    ];
    return {
      all: function() {
        return cards;
      }
    };
  };
  return angular.module("starter").factory("Chats", Chats).factory("Cards", Cards);
})();
