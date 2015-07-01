$(document).on 'page:change', ->
  $("#new_answer").on "ajax:success", (e, data, status, xhr) ->
    $("#answers_to_question").html(xhr.responseText) 
    $('input#anser_text').val('')