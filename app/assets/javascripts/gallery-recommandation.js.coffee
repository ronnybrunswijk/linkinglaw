$(document).on 'ready page:load', ->
    start()
    $('#recommandations .gallery-item').css('width', calc_item_width)
    $('#recommandations .gallery').on 'mouseover', stop
    $('#recommandations .gallery').on 'mouseout', start

galleryTimer = null

start = ->
 	galleryTimer = setInterval(slide, 5000) unless galleryTimer

stop = ->
  clearInterval(galleryTimer);
  galleryTimer = null;

slide = ->
    first = true
    distance = $('#recommandations .gallery').width()
    $('#recommandations .gallery .items-container').slice(0,2).animate
        left:"-=" + distance + "px",
        300,
        ->
         	if first
      	    $(this).detach().appendTo('#recommandations .gallery')
      	    $(this).css('left', distance)
      	    first = false

calc_item_width = ->
  items = $('#recommandations .items-container').first().children().length
  100 / items + '%'
