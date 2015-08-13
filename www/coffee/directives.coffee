(->
  "use strict"

  noScroll = ->
    restrict: "E"
    link: ($scope, $element, $attr) ->
      $element.on("touchmove", (e) ->
        e.preventDefault()
        return
      )
      return

  angular
    .module("starter")
    .directive("tdCard", noScroll)
)()
