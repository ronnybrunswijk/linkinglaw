$(document).on 'page:change', ->
  $("#new_answer").on "ajax:success", (e, data, status, xhr) ->
    $("#answers_to_question").html(xhr.responseText) 
    $('textarea#answer_text').val('')
    
  bind_endorsement_action()
    
bind_endorsement_action = ->    
  $("form.endorsement").on "ajax:success", (e, data, status, xhr) ->
    $form = $(e.target)
    $form.parent().html(data)
    bind_endorsement_action()
  
  $("form.endorsement").on "ajax:error", (e, xhr, status, error) ->
    console.log(error)


  