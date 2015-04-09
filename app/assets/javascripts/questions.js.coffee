field_ids = ['#question_title', '#question_description']

$ ->
  do  init_char_count
  $(field_ids.join(",")).bind 'keyup', (event) =>
    $el = $(event.target)
    maxlength = parseInt($el.attr('maxlength'))
    remaining_chars = maxlength - $el.val().length
    $el.prevAll('.char_count').find('span').text(remaining_chars)

init_char_count = ->
  for field_id in field_ids
    do (field_id) ->
       length = $(field_id).val().length
       maxlength = $(field_id).attr('maxlength')
       $(field_id).prevAll('.char_count').find('span').text(maxlength - length)  