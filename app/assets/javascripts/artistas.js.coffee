# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".owl-carousel").owlCarousel ->
    autoPlay: 3000
    items : 1

  for div in $("[render]")
    d = $(div)
    $.get d.attr("render"), (data) ->
      d.html data
