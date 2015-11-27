Stel(/^als juridische professional ga ik naar de 'gestelde vragen' pagina$/) do
  visit '/questions/list'
  page.find("title", I18n.t(:all, scope: [:questions]), visible: false)
  assert_equal "lawyer", @current_user.role
end

Dan(/^verwacht ik een overzicht van vragen die ondernemers onlangs hebben gesteld$/) do
  questions = Question.select_by_regions(@current_user.notification_setting.provinces)
  assert questions.size > 0
  questions.each do |question|
    assert page.find("a", text: question.title)
  end 
end


