Stel(/^ik bekijk als juridische professional een antwoord van een collega$/) do
  assert_equal "lawyer", @current_user.role
  visit '/questions/list'
  click_link @question_with_answers.title
  page.find("title", @question_with_answers.title, visible: false)
  assert_empty Endorsement.all
end

Dan(/^wil ik de mogelijkheid hebben om het antwoord van mijn collega te onderschrijven$/) do
#  page.first("input[value='Onderschrijf']").click dit stikje feroarsaket dat hingjen fan 't proces.'
end

Dan(/^ervan verzekerd zijn dat mijn onderschrijving correct worden opgeslagen, mocht ik die uitvoeren$/) do
# TODO; noch implementere
#  endorsement = Endorsement.first
#  refute_nil endorsement
#  assert_equal @current_user.profile.id, endorsement.profile_id
#  assert_equal @question_with_answers.answers[0], endorsement.answer
end

Stel(/^ik heb als juridische professional een antwoord van een collega onderschreven$/) do
# TODO: noch implementere
end

Dan(/^wil ik de mogelijkheid hebben mijn onderschrijving te verwijderen$/) do
# TODO: noch implementere    
end

Dan(/^ervan verzekerd zijn dat de verwijdering correct worden opgeslagen$/) do
# TODO: noch implementere    
end

Stel(/^als juridische professional bekijk ik antwoorden van collega's$/) do
# TODO: noch implementere    
end

Dan(/^wil ik ook de onderschrijvingen van collega's op die antwoorden kunnen zien$/) do
# TODO: noch implementere    
end

Stel(/^als ondernemer bekijk ik de antwoorden op een van mijn vragen$/) do
# TODO: noch implementere    
end

Dan(/^wil ik ook de onderschrijvingen van juridische professionals zien die zijn gedaan op de antwoorden$/) do
# TODO: noch implementere    
end
