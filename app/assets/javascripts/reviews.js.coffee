$(document).on 'ready page:change', ->
  $("#review_rating").rating({glyphicon:false})
  $("#review_rating").on 'rating.change', (event, value, caption) ->
      $(this).val(value)
  $("#review_rating").on 'rating.clear', (event) ->
      $(this).val('')
  
  