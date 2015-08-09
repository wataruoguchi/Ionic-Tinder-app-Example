(->
  "use strict"
  DashCtrl = ->
    return

  ChatsCtrl = (Chats) ->
    # Use ViewModel instead of scope
    vm = @
    vm.chats = Chats.all()
    vm.remove = (chat) ->
      Chats.remove chat
      return
    return

  ChatDetailCtrl = ($stateParams, Chats) ->
    vm = @
    vm.chat = Chats.get $stateParams.chatId
    return

  AccountCtrl = ->
    vm = @
    vm.settings = {
      enableFriends: true
    }
    return

  angular
    .module("starter")
    .controller("DashCtrl", DashCtrl)
    .controller("ChatsCtrl", ChatsCtrl)
    .controller("ChatDetailCtrl", ChatDetailCtrl)
    .controller("AccountCtrl", AccountCtrl)
)()
