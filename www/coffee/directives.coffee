(->
  "use strict"

  noScroll = ->
    restrict: "A"
    link: ($scope, $element, $attr) ->
      $element.on("touchmove", (e) ->
        e.preventDefault()
        return
      )
      return

  tabSlideBoxScrollExtension = ["$timeout", "$window", ($timeout, $window) ->
    restrict: "E"
    link: (scope, element, attrs) ->
      $timeout(->
        iconsDiv = element[0].querySelector(".tsb-icons")
        styles = $window.getComputedStyle(iconsDiv)
        margins = parseFloat(styles["marginTop"]) + parseFloat(styles["marginBottom"])
        iconsOffsetHeight = iconsDiv.offsetHeight + margins + "px"
        ionContent = element.find("ion-content")
        expndSld = angular.element(ionContent)
        expndSld.css("margin-bottom", iconsOffsetHeight)
        return
      , 500)
      return
  ]

  angular
    .module("starter")
    .directive("tdCard", noScroll)
    .directive('tabSlideBox', tabSlideBoxScrollExtension)
)()
