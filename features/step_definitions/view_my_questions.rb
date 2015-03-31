Stel(/^ik ben ingelogd als ondernemer$/) do
    page.find("a", text: I18n.t(:sign_out, scope: [:devise, :sessions]))
end

Als(/^ik naar de 'Mijn vragen' pagina ga$/) do
    visit questions_path
    page.find("title", text: I18n.t(:all, scope: [:questions]))
end

Dan(/^wil ik al mijn eerder gestelde vragen zien$/) do
    question = @user.questions.first
    page.find("a", text: question.title)
end

Stel(/^ik bevind me op de 'Mijn vragen' pagina$/) do
  step "ik naar de 'Mijn vragen' pagina ga"
end

Als(/^ik dan op (\d+) van mijn gestelde vragen klik$/) do |arg1|
    question = @user.questions.first
    click_link question.title
end

Dan(/^wil ik de details zien van de vraag, waarop ik heb geklikt$/) do
    question = @user.questions.first
    page.find("title", text: question.title)
    assert page.has_content?(question.title)
    assert page.has_content?(question.description)
end
