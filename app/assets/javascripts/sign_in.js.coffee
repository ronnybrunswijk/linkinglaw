$ ->
  $("#new_user").on("ajax:success", (e, data, status, xhr) ->
    $("body").append xhr.responseText)
  .on "ajax:error", (e, xhr, status, error) ->
    $("body").append "<p>ERROR</p>"
			      