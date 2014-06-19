# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
	       $('#question_subject').focus()
	       $('#question_subject').focus -> move(-1)
	       $('#question_description').focus -> move(94)

move = (top)->
         $('#input-hint').animate top: top + 'px', 200
 

     