professions = ["Advocaat","Jurist","Fiscalist"]

$(document).on 'page:change', ->
  init_profession()
  
  $('#user_profile_attributes_address_attributes_zip_code').bind 'blur', (e) ->
    zip_code = $(e.target).val()
    supplement_address(zip_code)
    
  $('select#professions').bind 'keydown', (e) ->
     $(this.options).first().remove()

  $('select#professions').bind 'change', (e) ->
      if this.selectedIndex is this.options.length - 1
        update_profession_input('')
      else
        update_profession_input(this.options[this.selectedIndex].value)

   $('a.practice-area-search-link').bind 'click', (e) ->
     

init_profession = ->
  profession = $('#profile_profession').val()
  if profession? and profession not in professions
    $("#user_profile_attributes_profession_form_group").removeClass('hidden')
    $("select#professions").val("Anders")    

update_profession_input = (val) ->
  $formGroup = $("#user_profile_attributes_profession_form_group")
  if val
    $formGroup.addClass('hidden')
  else
    $formGroup.removeClass('hidden')
  $("input#user_profile_attributes_profession").val(val).focus()
  
supplement_address = (zip_code) ->
  $.ajax
    url: "/addresses/#{zip_code}"
    error: (jqXHR, textStatus, errorThrown) ->
      console.log(errorThrown)
    success: (data, textStatus, jqXHR) ->
      $('#user_profile_attributes_address_attributes_street').val(data.resource.street)
      $('#user_profile_attributes_address_attributes_city').val(data.resource.town)
      
search_profile = (practice_area_id, province_id) ->
  query_string = ""
  query_string = "practice_area_id=#{practice_area_id}" if practice_area_id
  query_string += "&" if practice_area_id and province_id
  query_string += "province_id=#{province_id}" if province_id
  
  $.ajax
    url: "/profiles?#{query_string}"
    error: (jqXHR, textStatus, errorThrown) ->
      console.log(errorThrown)
    success: (data, textStatus, jqXHR) ->
      $("#search-results").val(data.profiles)
  