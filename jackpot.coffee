$ = require('jquery')
_ = require('underscore')

$ ->
  $.getJSON 'https://web.fulcrumapp.com/shares/c05e34a9f519e3d0.geojson', (data) ->
    totalCost = 0
    totalWon = 0

    _.each data.features, (record) ->
      totalCost += +record.properties.cost
      totalWon += +record.properties.winnings

    net = totalWon - totalCost

    $('.spent').html("$#{totalCost}")
    $('.won').html("$#{totalWon}")

    $('.count').html(data.features.length.toString())

    if net >= 0
      $('.net').html("$#{net}").addClass('gain')
    else
      $('.net').html("$#{net}").addClass('loss')
