(->
  "use strict"
  ###
  # Models
  # "appModalService" passes parameters from controller to controller.
  # Every modal views is called through here.
  ###
  Modals = ["appModalService", (appModalService) ->
    showCardItem = (card) ->
      appModalService.show("templates/modal-tinder-card.html", "TinderModalCtrl as vm", card)
    showTerm = () ->
      appModalService.show("templates/modal-term-of-service.html", "GeneralModalCtrl as vm", null)
    showPrivacy = () ->
      appModalService.show("templates/modal-privacy-policy.html", "GeneralModalCtrl as vm", null)
    showProfile = () ->
      appModalService.show("templates/modal-profile.html", "ProfileModalCtrl as vm", null)
    showPreferences = () ->
      appModalService.show("templates/modal-preferences.html", "GeneralModalCtrl as vm", null)
    showSettings = () ->
      appModalService.show("templates/modal-app-settings.html", "GeneralModalCtrl as vm", null)

    service = {
      showCardItem: showCardItem
      showTerm: showTerm
      showPrivacy: showPrivacy
      showProfile: showProfile
      showPreferences: showPreferences
      showSettings: showSettings
    }

    service
  ]

  angular
  .module("starter")
  .factory("Modals", Modals)
)()
