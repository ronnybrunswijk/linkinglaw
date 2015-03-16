# Feature: Ask a question page
#   As a visitor
#   I want to visit the aks a question page
#   So I can ask a question to a legal professional
feature 'Ask question page' do

  # Scenario: Visit the aks a quesiton page
  #   Given I am a visitor
  #   When I visit the ask a question page
  #   Then I see a heading 'Ask a question'
  scenario 'visit the aks a question page' do
    visit root_path
    expect(page).to have_content I18n.t(:ask_question, scope: [:questions])
  end

end
