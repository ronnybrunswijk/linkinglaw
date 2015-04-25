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

Dan(/^wil ik de mogelijkheid om alsnog meteen mijn inloggevens in te voeren$/) do
  page.find("form#sign_in_user")
  user = FactoryGirl.create(:user)
  fill_in "user_email_sign_in", with: user.email
  fill_in "user_password_sign_in", with: user.password
  click_button 'sign_in'
end

Dan(/^dan tegelijkertijd kunnen inloggen en mijn vraag stellen$/) do
#  pending
#   puts page.body
#   page.find("title", text: @title)
#  page.find("a", text: I18n.t(:sign_out, scope: [:devise, :sessions]))
#  page.find("a", text: @title)  
end
