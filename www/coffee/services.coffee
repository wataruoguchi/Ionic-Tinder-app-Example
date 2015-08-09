(->
  "use strict"
  Chats = ->
    chats = [
      {
        id: 0
        name: "Ben Sparrow",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      },
      {
        id: 1
        name: "Ben Sparrow",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      },
      {
        id: 2
        name: "Ben Sparrow",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      },
      {
        id: 3
        name: "Ben Sparrow",
        lastText: "You on your way?"
        face: "https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png"
      },
      {
        id: 4
        name: "Ben Sparrow",
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

  angular
  .module("starter")
  .factory("Chats", Chats)
)()
