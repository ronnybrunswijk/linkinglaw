Stel(/^als ondernemer bevind ik me op de 'preview vraag' pagina$/) do
  @title = " I coulda had class. I coulda been a contender."
  visit new_question_path
  fill_in "question_title", with: @title
  fill_in "question_description", with: "a"
  click_button I18n.t(:preview_question, scope: [:questions])
  page.find("title", text: I18n.t(:preview_question, scope: [:questions]))
end

Stel(/^ik wil mijn vraag plaatsen, maar ben niet ingelogd$/) do
  page.find("title", text: I18n.t(:preview_question, scope: [:questions]))
  page.find("a", text: I18n.t(:sign_in, scope: [:devise, :sessions]))  
end

Dan(/^wil ik de mogelijkheid om alsnog meteen in te loggen$/) do
  page.find("form#sign_in_user")
end

Stel(/^ik wil mijn vraag plaatsen, maar heb me nog niet geregistreerd$/) do
  page.find("title", text: I18n.t(:preview_question, scope: [:questions]))
  page.find("a", text: I18n.t(:sign_up, scope: [:devise, :registrations]))
end

Dan(/^wil ik de mogelijkheid om me alsnog meteen te registreren$/) do
  page.find("form#new_user")
end

Als(/^ik daarbij een verkeerd bevestigingswachtwoord invoer$/) do
  choose "auth_form_sign_up" 
  fill_in "user_email", with: "IfuckAnything@that.moves" 
  fill_in "user_password", with: "12345678"
  fill_in "user_password_confirmation", with: "87654321"
  click_button "sign_up"
end

Dan(/^wil ik een gepaste foutmelding zien$/) do
  page.find("title", text: I18n.t(:preview_question, scope: [:questions]))
  assert page.has_content?("Bevestiging wachtwoord komt niet overeen met Wachtwoord")
end

Als(/^ik alsnog meteen inlog en daarbij een verkeerd wachtwoord invoer$/) do
   fill_in "user_email_sign_in", with: "jack.dempsey@boxing.ko"
   fill_in "user_password_sign_in", with: "wrong password"
   click_button "sign_in"
end

Dan(/^wil ik een gepaste "(.*?)" zien$/) do |foutmelding|
   page.find("title", text: I18n.t(:preview_question, scope: [:questions]))
   assert page.has_content?(foutmelding)
end
