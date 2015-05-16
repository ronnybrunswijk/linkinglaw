Stel(/^ik ben ingelogd als ondernemer$/) do
    page.find("a", text: I18n.t(:sign_out, scope: [:devise, :sessions]))
end

Als(/^ik naar de 'Mijn vragen' pagina ga$/) do
    visit questions_path
    page.find("title", text: I18n.t(:all, scope: [:questions]))
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
    page.find("title", text: question.title)
    assert page.has_content?(question.title)
    assert page.has_content?(question.description)
end

Stel(/^ik bevind me op de 'Home' pagina$/) do
    visit "/"
    page.find("title", text: "Home")
end

Stel(/^ik ben niet ingelogd$/) do
    page.find("a", text: I18n.t(:sign_in, scope: [:devise, :sessions]))
end

Als(/^ik dan via de adresbalk naar de 'Mijn vragen' pagina navigeer$/) do
    visit "/questions"
end

Dan(/^wil ik op de 'Log in' pagina terecht komen$/) do
    page.find("title", text: "Log in")
end

Dan(/^een melding zien dat ik nog moet inloggen$/) do
    assert page.has_content? I18n.t(:unauthenticated, scope: [:devise, :failure])   
end
