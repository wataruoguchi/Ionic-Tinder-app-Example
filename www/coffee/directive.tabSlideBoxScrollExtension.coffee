(->
  "use strict"
  # tabSlideBoxScrollExtension
  # Without this contents inside of TabSlideBox are not able to be scrolled by the bottom.
  tabSlideBoxScrollExtension = ["$timeout", "$window", ($timeout, $window) ->
    restrict: "E"
    link: (scope, element, attrs) ->
      # $timeout is supposed to wait rendering contents to get the height of ".tsb-icons"
      $timeout(->
        # Get the height of ".tsb-icons"
        iconsDiv = element[0].querySelector(".tsb-icons")
        styles = $window.getComputedStyle(iconsDiv)
        margins = parseFloat(styles["marginTop"]) + parseFloat(styles["marginBottom"])
        iconsOffsetHeight = iconsDiv.offsetHeight + margins + "px"
        # expand inside contents with "margin-bottom"
        ionContent = element.find("ion-content")
        expndSld = angular.element(ionContent)
        expndSld.css("margin-bottom", iconsOffsetHeight)
        return
      , 500)
      return
  ]

  angular
    .module("starter")
    .directive("tabSlideBox", tabSlideBoxScrollExtension)
)()
