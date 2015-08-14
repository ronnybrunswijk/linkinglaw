Stel(/^als juridische professional bekijk ik een vraag van een ondernemer die ik wil beantwoorden$/) do
  @question = Question.first
  visit new_answer_path(question_id: @question.id)
  page.find("title", text: "Plaats een antwoord", visible: false)
end

Dan(/^wil ik de mogelijkheid hebben om dat meteen te doen$/) do
  text = "No I'm a combat correspondent."
  fill_in "answer_text", with: text
  click_button "Plaats antwoord"
  page.find("#answers_to_question p", text: text)
  page.assert_no_text('input#answer_text')
end

Dan(/^dat de ondernemer op de hoogte wordt gesteld van mijn antwoord$/) do
 # TODO noch implementere
end

Stel(/^als juridische professional bekijk ik een vraag van een ondernemer$/) do
  visit new_answer_path(question_id: @question_with_answers.id)
  page.find("title", text: "Plaats een antwoord", visible: false)
end

Dan(/^wil ik ook de antwoorden die daarop al gegeven zijn, zien$/) do
  @question_with_answers.answers.each do |answer|
      page.find("p", text: answer.text)
  end
end
