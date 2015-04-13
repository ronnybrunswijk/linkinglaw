$(document).on 'page:change', ->
  for field in $('[maxlength]')
    do (field) ->
       set_remaining_chars field

  $('[maxlength]').bind 'keyup', (event) =>
    set_remaining_chars event.target
		  
set_remaining_chars = (field) ->
  $field = $(field)
  remaining_chars = $field.attr('maxlength') - $field.val().length
  $field.closest('.form-group').find('.char_count span').text(remaining_chars)   