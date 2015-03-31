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
