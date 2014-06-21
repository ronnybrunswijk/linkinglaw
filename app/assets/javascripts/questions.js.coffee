# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
	       $('#question_subject').focus()
	       $('#question_subject').focus -> move('question_subject', -1)
	       $('#question_description').focus -> move('question_description', 94)

move = (id, top)->
     hint = $('#hint_' + id).html()
     $('#input-hint').empty().html(hint).animate top: top + 'px', 200
 

     