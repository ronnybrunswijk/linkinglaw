Stel(/^ik bevind me op de landings pagina voor de juridische professional en ik wil me registreren$/) do
  visit '/lawyer'
  page.find("title", "Juridische Professional", visible: false)
end

Dan(/^wil ik een duidelijke optie die leidt naar het registratieformulier$/) do
  find_link "signup-lawyer"
end

Als(/^ik dan naar registratieformulier voor de juridisch professional ga$/) do
  click_link "signup-lawyer"
  page.find('title', "Registreren Juridiscche Professional", visible: false) 
end

Dan(/^wil ik alle noodzakelijke gegevens kunnen opvoeren en verzenden$/) do

  # account info
  fill_in "user_name", with: "Iron Mike"
  fill_in "user_email", with: "irom@mike.nl"
  fill_in "user_password", with: "right hook"
  fill_in "user_password_confirmation", with: "right hook"

  #profile info
#  fill_in "user_profile_attributes_name", with: "Profile name Iron Mike"
#  select "belastingen", from: "Rechtsgebied"  
  click_button "Registreren" 
end

Dan(/^daarna verwittigd worden over dat mijn registratie gelukt is$/) do
  page.find("title", "Home", visible: false)
  user = User.find_by name: "Iron Mike"
  assert_not_nil user
#  assert_equal "lawyer", user.role
  assert_equal "Iron Mike", user.name
  profile = user.profile
#  assert_not_nil profile
  assert page.has_content? I18n.t(:signed_up_but_inactive, scope: [:devise, :registrations])
end

