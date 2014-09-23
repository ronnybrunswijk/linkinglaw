$(document).on 'ready page:load', ->
    start()
    $('#gallery').on 'mouseover', stop
    $('#gallery').on 'mouseout', start

galleryTimer = null

start = ->
 	galleryTimer = setInterval(slide, 5000) unless galleryTimer

stop = ->
  clearInterval(galleryTimer);
  galleryTimer = null;

slide = ->
    first = true
    distance = $('#gallery').width()
    $('.items-container').slice(0,2).animate
        left:"-=" + distance + "px",
        300,
        ->
         	if first
      	    $(this).detach().appendTo('#gallery')
      	    $(this).css('left', distance)
      	    first = false

