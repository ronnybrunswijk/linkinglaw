$(document).on 'page:change', ->
  $("#sign_in_user").bind "ajax:success", (e, data, status, xhr) ->
    if data.success
      update_auth_token(xhr)
      $("#create_question").click()
    else
      console('error')

update_auth_token = (xhr) ->
  csrf_param = xhr.getResponseHeader('X-CSRF-Param')
  csrf_token = xhr.getResponseHeader('X-CSRF-Token')

  if csrf_param 
    $('meta[name="csrf-param"]').attr('content', csrf_param)
  if csrf_token
    $('meta[name="csrf-token"]').attr('content', csrf_token)
    $('input[name="authenticity_token"]').val(csrf_token)