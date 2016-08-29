$(document).on 'ready page:change', ->
  set_time_select_visibility()
  register_time_select_change_handler()
    
set_time_select_visibility = ->
  el = $('#interval input[checked=checked]')
  if el.attr('data-hours') != '24'
    $('#time-select').css('visibility':'hidden')    

register_time_select_change_handler = ->
  $('#interval input').bind 'change', (e) ->
    el = $(e.target)
    if el.attr('data-hours') != '24' 
        $('#time-select').css('visibility':'hidden')
    else
        $('#time-select').css('visibility':'visible')
