Stel(/^ik ben ingelogd als ondernemer$/) do
    page.find("a", text: @current_user.email)
end

Als(/^ik naar de 'Mijn vragen' pagina ga$/) do
    visit questions_path
    page.find("title", text: I18n.t(:mine, scope: [:questions]), visible: false)
end

Dan(/^wil ik al mijn eerder gestelde vragen zien$/) do
    question = @current_user.questions.first
    page.find("a", text: question.title)
end

Stel(/^ik bevind me op de 'Mijn vragen' pagina$/) do
  step "ik naar de 'Mijn vragen' pagina ga"
end

Als(/^ik dan op (\d+) van mijn gestelde vragen klik$/) do |arg1|
    question = @current_user.questions.first
    click_link question.title
end

Dan(/^wil ik de details zien van de vraag, waarop ik heb geklikt$/) do
    question = @current_user.questions.first
    page.find("title", text: question.title, visible: false)
    assert page.has_content?(question.title)
    assert page.has_content?(question.description)
end

Stel(/^ik bevind me op de 'Home' pagina$/) do
    visit "/"
    page.find("title", text: "Home", visible: false)
end

Stel(/^ik ben niet ingelogd$/) do
    page.find("a", text: I18n.t(:sign_in, scope: [:devise, :sessions]))
end

Als(/^ik dan via de adresbalk naar de 'Mijn vragen' pagina navigeer$/) do
    visit "/questions"
end

Dan(/^wil ik op de 'Log in' pagina terecht komen$/) do
    page.find("title", text: I18n.t(:sign_in, scope: [:devise, :sessions]), visible: false)
end

Dan(/^een melding zien dat ik nog moet inloggen$/) do
    assert page.has_content? I18n.t(:unauthenticated, scope: [:devise, :failure])   
end

Stel(/^ik bevind me op de detail pagina van (\d+) van mijn vragen$/) do |arg1|
    question = @current_user.questions.first
    visit "/questions/#{question.id}"
    page.find("title", text: question.title, visible: false)
end

Dan(/^wil via de 'Naar overzicht' link weer terug kunnen naar het overzicht van al mijn gestelde vragen$/) do
    click_link "Naar overzicht"
    page.find("title", text: I18n.t(:mine, scope: [:questions]), visible: false)    
    page.assert_selector("div.authform table a", count: @current_user.questions.size)
end

Dan(/^daarbij de antwoorden die zijn gegeven op de vraag$/) do
    question = @current_user.questions.first
    question.answers.each do |answer|
        page.find("div#answers_to_question p", text: answer.text)
    end
end
