# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@modelos =
  quadro:
    cores: ["Branco"]
    tamanhos: ["3x3", "4x4"]
  bistro:
    cores: ["Carvão", "Chocolate", "Azul"]
    tamanhos: ["50cm", "60cm"]

angular.module("tamboApp", [])
  .controller "simulator", ($scope) ->
    $scope.modelos = modelos

