# Feature: Preview question page
#   As a visitor
#   I want to visit the preview question page
#   So I can preview the question I want to post
feature QuestionsController, type: :controller do
 
  # Scenario: Visit the preview quesiton page
  #   Given I am a visitor
  #   When I visit the preview question page
  #   Then I see a heading 'Preview question'
  scenario 'visit the preview question page' do
     post preview_questions_path, question: { title: 'title', description: 'description' }
     expect(page).to have_content I18n.t(:preview_question, scope: [:questions])
  end

end
