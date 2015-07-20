Stel(/^als ondernemer bevind ik me op de 'preview vraag' pagina$/) do
  @title = "I coulda had class. I coulda been a contender."
  visit new_question_path
  fill_in "question_title", with: @title
  fill_in "question_description", with: "a"
  click_button I18n.t(:preview_question, scope: [:questions])
  page.find("title", text: I18n.t(:preview_question, scope: [:questions]), visible: false)
end

Stel(/^ik wil mijn vraag plaatsen, maar ben niet ingelogd$/) do
  page.find("title", text: I18n.t(:preview_question, scope: [:questions]), visible: false)
  page.find("a", text: I18n.t(:sign_in, scope: [:devise, :sessions]))  
end

Dan(/^wil ik de mogelijkheid om alsnog meteen in te loggen$/) do
  page.find("form#sign_in_user")
end

Stel(/^ik wil mijn vraag plaatsen, maar heb me nog niet geregistreerd$/) do
  page.find("title", text: I18n.t(:preview_question, scope: [:questions]), visible: false)
  page.find("a", text: I18n.t(:sign_up, scope: [:devise, :registrations]))
end

Dan(/^wil ik de mogelijkheid om me alsnog meteen te registreren$/) do
  choose "auth_form_sign_up"
  page.find("form#new_user")
end

Als(/^ik daarbij een verkeerd bevestigingswachtwoord invoer$/) do
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
   page.find("title", text: I18n.t(:preview_question, scope: [:questions]), visible: false)
   assert page.has_content?(foutmelding)
end

Stel(/^als ondernemer bevind ik me op de 'preview vraag' pagina en ben niet ingelogd$/) do
  step "als ondernemer bevind ik me op de 'preview vraag' pagina"
  page.find("a", text: I18n.t(:sign_in, scope: [:devise, :sessions]), visible: false)
end

Dan(/^wil ik de mogelijk hebben om mijn vraag te wijzigen$/) do
  find_button I18n.t(:update, scope: [:labels])
end

Als(/^ik gebruik maak van de mogelijkheid om mijn vraag te wijzigen$/) do
  click_button I18n.t(:update, scope: [:labels])
end

Dan(/^wil ik terugkeren naar 'vraag plaatsen' pagina$/) do
   page.find("title", text: I18n.t(:ask_question, scope: [:questions]), visible: false)  
end

Stel(/^als ondernemer heb ik een vraag opgevoerd die ik daadwerkelijk wil stellen$/) do
  step  "als ondernemer bevind ik me op de 'preview vraag' pagina" 
end

Dan(/^wil ik daarbij ook het rechtsgebied, waarop de vraag betrekking heeft, kunnen selecteren$/) do
  @practice_area = PracticeArea.first
  select @practice_area.subject,  from: 'question_practice_area_id'
  click_button "Plaats vraag"
end

Dan(/^dat het geselecteerde rechtsgebied tezamen met mijn vraag wordt opgeslagen$/) do
  page.find("title", text: @title, visible: false)
  question = Question.find_by title: @title  
  assert_equal @practice_area, question.practice_area
end

Dan(/^wil ik daarbij ook de regios, waarin juridische professionals werkzaam zijn, kunnen selecteren$/) do
   @provinces = Province.take(2)
   @provinces.each do |province|
      check "question_province_ids_#{province.id}"      
   end
   click_button "Plaats vraag"
end

Dan(/^dat de geselecteerde regios tezamen met mijn vraag worden opgeslagen$/) do
  page.find("title", text: @title, visible: false)
  question = Question.find_by title: @title
  assert_equal @provinces, question.provinces
end
