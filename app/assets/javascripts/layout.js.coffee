$(document).on 'ready page:load', ->
  $('#notification-btn').on 'click', expand_notification
	$('a.selected').removeClass()
	pageId = $('#pageId').val()
	$('#' + pageId).addClass('selected')

expand_notification = ->
  bottom = "0"
  if $('#notification').position().top + $('#notification').height() - $(window).height() < 100
    bottom = "-154px"
  $('#notification').animate
    bottom: bottom,
    300,
    ->
      rotate = 'rotate(180deg)'
      if bottom != "0"
        rotate = 'rotate(0deg)'
      $('#notification-btn').css('transform', rotate)
  
