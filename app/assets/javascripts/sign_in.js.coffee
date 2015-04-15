$(document).on 'page:change', ->
  $('#sign_in').bind 'click', sign_in

sign_in = ->
  $.ajax
    url: '/users/sign_in'
    type: 'POST'
    done: (data, status, response) ->
      console.log("Success")
    error: (jqXHR, textStatus, errorThrown) ->
      console.log(errorThrown)
    data: {  
      user: {
        email: "rienkboonstra1@yahoo.fr",
        password: "Elkana01",
        remember_me: 1
      }
   }
			      