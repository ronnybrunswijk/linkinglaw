$(document).on 'ready page:load', ->
    start()
    $('#recommandations .gallery-item').css('width', calc_item_width)
    $('#recommandations .gallery').on 'mouseover', stop
    $('#recommandations .gallery').on 'mouseout', start

galleryTimer = null

start = ->
 	galleryTimer = setInterval(slide, 10000) unless galleryTimer

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
    $next = $('#recommandations .item-position').next()
    $('#recommandations .item-position').removeClass()
    if $next.length == 0
      $('.item-position-indicator div')
        .first()
        .addClass('item-position')
    else
      $next.addClass('item-position')

calc_item_width = ->
  items = $('#recommandations .items-container').first().children('.gallery-item').length
  100 / items + '%'
