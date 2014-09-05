# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  for div in $("[render]")
    d = $(div)
    $.get d.attr("render"), (data) ->
      d.html data
