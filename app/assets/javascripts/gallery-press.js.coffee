$(document).on 'ready page:load', ->
    start()
    $('#press .gallery-item').css('width', calc_item_width)
    $('#press .gallery').on 'mouseover', stop
    $('#press .gallery').on 'mouseout', start

galleryTimer = null

start = ->
 	galleryTimer = setInterval(slide, 5000) unless galleryTimer

stop = ->
  clearInterval(galleryTimer);
  galleryTimer = null;

slide = ->
    first = true
    distance = $('#press .gallery').width()
    $('#press .gallery .items-container').slice(0,2).animate
        left:"-=" + distance + "px",
        300,
        ->
         	if first
      	    $(this).detach().appendTo('#press .gallery')
      	    $(this).css('left', distance)
      	    first = false

calc_item_width = ->
  items = $('#press .items-container').first().children().length
  100 / items + '%'
