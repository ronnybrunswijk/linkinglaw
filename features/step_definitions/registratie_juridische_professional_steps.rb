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
  fill_in "user_email", with: "iron@mike.nl"
  fill_in "user_password", with: "right hook"
  fill_in "user_password_confirmation", with: "right hook"

  #profile info
  fill_in "user_profile_attributes_first_name", with: "Iron Mike"
  fill_in "user_profile_attributes_last_name", with: "Tyson"  
  fill_in "user_profile_attributes_business_address", with: "Knock out street 2"  
  fill_in "user_profile_attributes_city", with: "New York"  
  fill_in "user_profile_attributes_phone", with: "(999) 999-9999"    
  select "Fiscalist", from: "Functie"
#  choose "Ja" Dit is registrere under nr. 374 op de backlog
  select "5", from: "Aantal jaren werkervaring"
  fill_in "KvK-nummer (indien van toepassing)", with: "123456" 
  click_button "Registreren" 
end

Dan(/^daarna verwittigd worden over dat mijn registratie gelukt is$/) do
  page.find("title", "Home", visible: false)
  user = User.find_by email: "iron@mike.nl"
  assert_not_nil user
  assert_equal "lawyer", user.role
  profile = user.profile
  assert_not_nil profile
  assert_equal "Iron Mike", profile.first_name
  assert_equal "Tyson", profile.last_name
  assert_equal "Knock out street 2", profile.business_address
  assert_equal "New York", profile.city
  assert_equal "(999) 999-9999", profile.phone
  assert_equal "Fiscalist", profile.profession
  assert_equal 5, profile.years_of_work_experience
  refute profile.disciplinary_decision
  assert_equal "123456", profile.chamber_of_commerce_no
  assert page.has_content? I18n.t(:signed_up_but_inactive, scope: [:devise, :registrations])
end

