$(document).on 'page:change', ->
  $('select#professions').bind 'keydown', (e) ->
     $(this.options).first().remove()

  $('select#professions').bind 'change', (e) ->
      if this.selectedIndex is this.options.length - 1
        update_profession_input('')
      else
        update_profession_input(this.options[this.selectedIndex].value)

update_profession_input = (val) ->
  $formGroup = $("#user_profile_attributes_profession_form_group")
  if val
    $formGroup.addClass('hidden')
  else
    $formGroup.removeClass('hidden')
  $("input#user_profile_attributes_profession").val(val).focus()