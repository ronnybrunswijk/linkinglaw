Stel(/^als juridische professional ga ik naar de 'gestelde vragen' pagina$/) do
  visit '/questions/list'
  page.find("title", I18n.t(:all, scope: [:questions]), visible: false)
  assert_equal "lawyer", @current_user.role
end

Dan(/^verwacht ik een overzicht van vragen die ondernemers onlangs hebben gesteld$/) do
  questions = Question.all
  questions.each do |question|
    assert page.find("a", text: question.title)
  end 
end

Stel(/^als juridische professional bevind ik met op de detail vraag pagina$/) do
    step "als juridische professional ga ik naar de 'gestelde vragen' pagina"
    question = Question.first 
    click_link question.title
    page.find("title", question.title, visible: false)
    click_link "Naar overzicht"
end

Dan(/^wil via de 'Naar overzicht' link weer terug kunnen naar het overzicht van alle gestelde vragen$/) do
    step "verwacht ik een overzicht van vragen die ondernemers onlangs hebben gesteld"
end
