# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("a[action=see]").click ->
    $(".main-image").attr("src",$(@).attr("big"))

  pxToInt = (attr) -> parseInt(attr.replace("px",""))
  console.log "main", $(".main-image")
  $(".main-image").on "mousemove", (event) ->
    event.preventDefault()
    zoom = $(".main-image").parent().find(".zoom")[0]
    if zoom is undefined
      zoom = $("<div></div>")
      zoom.css("background-color", "rgba(0,0,0,0.6)")
      zoom.css("display", "block")
      zoom.css("z-index", "99")
      zoom.css("position", "fixed")
      zoom.addClass("zoom")
      $(".main-image").parent().append(zoom)
    else
      zoom = $(zoom)

    if zoom.css("left") is "auto" or Math.abs(pxToInt(zoom.css("left")) -  event.originalEvent.clientX) > 5
      zoom.css("left", event.originalEvent.clientX)
    if zoom.css("top") is "auto" or Math.abs(pxToInt(zoom.css("top")) -  event.originalEvent.clientX) > 5
      zoom.css("top", event.originalEvent.clientY)

    preview = $(".preview-zoom")
    preview.css("background-image","url('#{$(".main-image").attr("src")}')")
    preview.css("background-position","-#{event.originalEvent.x-100}px -#{event.originalEvent.y-100}px")
    preview.show()

  $(".main-image").on "mouseout", (event) ->
    $(".main-image").parent().find(".zoom").remove()
    $(".preview-zoom").hide()

      

