# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
    start()
    $('#gallery').on 'mouseover', stop
    $('#gallery').on 'mouseout', start
    $('.main_nav ul li').bind 'click', (event) =>
      console.log('fucking')
      $(this).find('a').click()

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

