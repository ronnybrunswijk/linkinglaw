$(document).on 'page:change', ->
  $('#modify_question').bind 'click', (e) ->
    $('form#new_question').attr({action: '/questions/modify'}) 

  for field in $('[maxlength]')
    do (field) ->
       set_remaining_chars field

  $('[maxlength]').bind 'keyup', (e) =>
    set_remaining_chars e.target

  $('#auth_form_switch input[type=radio]').bind 'click', (e) ->
    show_auth_form e		  

set_remaining_chars = (field) ->
  $field = $(field)
  remaining_chars = $field.attr('maxlength') - $field.val().length
  $field.closest('.form-group').find('.char_count span').text(remaining_chars)   

show_auth_form = (e) ->
  $('#authforms form').addClass('hidden')
  if event.target.value is "sign_in" 
    $('form#sign_in_user').removeClass('hidden')
  else
    $('form#new_user').removeClass('hidden')