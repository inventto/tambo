# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
String.prototype.format = String.prototype.f = ->
    s = @
    i = arguments.length
    while (i--)
      s = s.replace(new RegExp('\\{' + i + '\\}', 'gm'), arguments[i])
    s
$ ->
  $("a[action=see]").click ->
    $(".main-image").attr("src",$(@).attr("big"))

  pxToInt = (attr) -> parseInt(attr.replace("px",""))
  console.log "main", $(".main-image")
  paused = false
  formatarEmReais = (valor) -> valor.toString().replace(".",",")
  mostraValorFrete = ->
    valor = 45.90
    $(".valor-frete").find(".em-reais").html(formatarEmReais(valor.toFixed(2))) # Usar formatador de verdade
    highChartRateio()
    novoTotal = realToFloat($(".total").attr("preco-produto")) + valor
    $(".total").text(formatarEmReais(novoTotal.toFixed(2)))

  $("#cep").on "change", mostraValorFrete
  $(".calcular-frete").on "click", mostraValorFrete
  $(".main-image").on "mousemove", (event) ->
    return if $(window).width() < 800
    previewZoom(event)
  previewZoom = (event) ->
    preview = $(".preview-zoom")
    zoom = $(".main-image").parent().find(".zoom")[0]
    if zoom is undefined
      zoom = $("<div></div>")
      zoom.css("background-color", "rgba(0,0,0,0.6)")
      zoom.css("display", "block")
      zoom.css("z-index", "9")
      zoom.css("position", "fixed")
      zoom.addClass("zoom")
      preview.css("background-image","url('#{$(".main-image").attr("src")}')")
      preview.css("background-repeat", "no-repeat")
      $(".main-image").parent().append(zoom)
      $(".description").hide()
      preview.show()

    else
      zoom = $(zoom)

    if zoom.css("left") is "auto" or Math.abs(pxToInt(zoom.css("left")) -  event.originalEvent.clientX) > 5 or
        zoom.css("top") is "auto" or Math.abs(pxToInt(zoom.css("top")) -  event.originalEvent.clientX) > 5
      zoom.css("left", event.originalEvent.clientX)
      zoom.css("top", event.originalEvent.clientY)
      x = event.originalEvent.x - 100
      y = event.originalEvent.y - 100
      preview.css("background-position","-#{x}px -#{y}px")


  $(".main-image").on "mouseout", (event) ->
    if not paused
      toPause = -> paused = null
      paused = setTimeout(toPause, 500)
      $(".main-image").parent().find(".zoom").remove()
      $(".preview-zoom").hide()
      $(".description").show()


  quantoGanha = (id) -> realToFloat($(".#{id}-ganha").text())
  realToFloat = (valor) -> parseFloat(valor.replace(",","."))
  highChartRateio = ->
    $("#rateio").highcharts
      title: { text: null }
      plotOptions: { series: { stacking: 'normal' } }
      xAxis: { categories: ['Rateio'] }
      chart:
        type: 'bar'
      series: [
          {name: 'Fabrica', data: [ quantoGanha "fabrica"] },
          {name: 'Artista', data: [ quantoGanha "artista"]},
          {name: 'Site',    data: [ quantoGanha "site"] }
          {name: 'Frete',   data: [ quantoGanha "frete"] }
       ]
  highChartRateio()
      

