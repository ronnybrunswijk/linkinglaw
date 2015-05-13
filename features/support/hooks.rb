Before do

    # Forces all threads to share the same connection. This works on
    # Capybara because it starts the web server in a thread.
    ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

end

Before('@signed_in') do
  @entrepreneur_with_1_question = FactoryGirl.create(:entrepreneur_with_1_question)
  visit '/users/sign_in'
  fill_in "user_email", with: @entrepreneur_with_1_question.email
  fill_in "user_password", with: @entrepreneur_with_1_question.password
  click_button I18n.t(:sign_in, scope: [:devise, :sessions])
end

