(->
  "use strict"
  Chats = ->
    chats = [
      {
        id: 0
        name: "Ben Sparrow",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }
      {
        id: 1
        name: "Ben Sparrow1",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }
      {
        id: 2
        name: "Ben Sparrow2",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }
      {
        id: 3
        name: "Ben Sparrow3",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }
      {
        id: 4
        name: "Ben Sparrow4",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }
      {
        id: 5
        name: "Ben Sparrow5",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }
      {
        id: 6
        name: "Ben Sparrow6",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }
      {
        id: 7
        name: "Ben Sparrow7",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }
      {
        id: 8
        name: "Ben Sparrow8",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }
      {
        id: 9
        name: "Ben Sparrow9",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      }
    ]

    all: ->
      chats
    remove: (chat) ->
      chats.splice chats.indexOf(chat), 1
      return
    get: (chatId) ->
      for i in [0..(chats.length - 1)]
        if chats[i].id is parseInt chatId
          return chats[i]
      null

  Cards = ->
    cards = [
      {img: "img/ionic.png", title: "img 1"}
      {img: "img/ionic.png", title: "img 2"}
      {img: "img/ionic.png", title: "img 3"}
    ]

    all: ->
      cards

  Modals = ["appModalService", (appModalService) ->
    showCardItem = (card) ->
      appModalService.show("templates/modal-tinder-card.html", "TinderModalCtrl as vm", card)
    showTerm = () ->
      appModalService.show("templates/modal-term-of-service.html", "GeneralModalCtrl as vm", null)
    showPrivacy = () ->
      appModalService.show("templates/modal-privacy-policy.html", "GeneralModalCtrl as vm", null)
    showProfile = (userid) ->
      appModalService.show("templates/modal-profile.html", "GeneralModalCtrl as vm", userid)
    showPreferences = (userid) ->
      appModalService.show("templates/modal-preferences.html", "GeneralModalCtrl as vm", userid)
    showSettings = (userid) ->
      appModalService.show("templates/modal-app-settings.html", "GeneralModalCtrl as vm", userid)

    service = {
      showCardItem: showCardItem
      showTerm: showTerm
      showPrivacy: showPrivacy
      showProfile: showProfile
      showPreferences: showPreferences
      showSettings: showSettings
    }
  ]

  angular
  .module("starter")
  .factory("Chats", Chats)
  .factory("Cards", Cards)
  .factory("Modals", Modals)
)()
