Stel(/^als ondernemer bevind ik me op de 'preview vraag' pagina$/) do
   visit '/questions/new'
   fill_in "question_title", with: "a"
   fill_in "question_description", with: "a"
   click_button I18n.t(:preview_question, scope: [:questions])
   page.find("title", text: I18n.t(:preview_question, scope: [:questions]))   
end

Stel(/^ik wil mijn vraag plaatsen, maar ben niet ingelogd$/) do
   page.find("a", text: I18n.t(:sign_in, scope: [:devise, :sessions]))
end

Dan(/^wil ik de mogelijkheid om alsnog meteen in te loggen$/) do

end
