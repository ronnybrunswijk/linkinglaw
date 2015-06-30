Stel(/^als juridische professional bekijk ik een vraag van een ondernemer die ik wil beantwoorden$/) do
  question = Question.first
  visit new_answer_path(question_id: question.id)
  page.find("title", text: "Plaats een antwoord", visible: false)
end

Dan(/^wil ik de mogelijkheid hebben om dat meteen te doen$/) do
  fill_in "answer_text", with: "No I'm a combat correspondent."
  click_button "Plaats antwoord"
end

Dan(/^dat de ondernemer op de hoogte wordt gesteld van mijn antwoord$/) do
#    pending # express the regexp above with the code you wish you had
  puts "Noch implementere"
end
