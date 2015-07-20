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

  fill_in_account
  fill_in_profile
  
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
  assert_equal "1000AA", profile.address.zip_code
  assert_equal "2", profile.address.housenumber
  assert_equal "hs", profile.address.housenumber_suffix
  assert_equal "Broadway", profile.address.street
  assert_equal "New York", profile.address.city
  assert_equal "Noord-Holland", profile.address.province.name
  assert_equal "(999) 999-9999", profile.phone
  assert_equal "Fiscalist", profile.profession
  assert_equal 5, profile.years_of_work_experience
  refute profile.disciplinary_decision
  assert_equal "123456", profile.chamber_of_commerce_no
  assert page.has_content? I18n.t(:signed_up_but_inactive, scope: [:devise, :registrations])
end

Stel(/^ik bevind me als juridische professional op de registratie pagina voor de juridische professionals$/) do
  visit '/users/sign_up?type=lawyer'
  page.find('title','Registreren juridische professional',visible: false)
end

Als(/^ik dan mijn functie wil opgeven, terwijl die niet voorkomt in de lijst met te selecteren functies$/) do
  @profession = "Legal counsel"
end

Dan(/^wil de mogelijkheid hebben, waarmee ik toch mijn functie kan opgeven$/) do
    
  fill_in_account
  fill_in_profile
  
  select 'Anders', from: 'professions'
  fill_in 'user_profile_attributes_profession', with: @profession
  
  click_button "Registreren"
end

Dan(/^dat de functie correct wordt geregistreerd in het systeem$/) do
  user = User.find_by email: "iron@mike.nl"
  assert_not_nil user
  profile = user.profile
  assert_not_nil profile
  assert_equal @profession, profile.profession
end

def fill_in_account
  fill_in "user_email", with: "iron@mike.nl"
  fill_in "user_password", with: "right hook"
  fill_in "user_password_confirmation", with: "right hook"
end

def fill_in_profile
  fill_in "user_profile_attributes_first_name", with: "Iron Mike"
  fill_in "user_profile_attributes_last_name", with: "Tyson"  
  fill_in 'user_profile_attributes_address_attributes_zip_code', with: "1000AA"
  fill_in 'user_profile_attributes_address_attributes_housenumber', with: "2"
  fill_in 'user_profile_attributes_address_attributes_housenumber_suffix', with: "hs"  
  fill_in "user_profile_attributes_phone", with: "(999) 999-9999"    
  select "Fiscalist", from: "professions"
#  choose "Ja" Dit is registrere under nr. 374 op de backlog
  select "5", from: "Aantal jaren werkervaring"
  fill_in "KvK-nummer (indien van toepassing)", with: "123456" 
end  

  
