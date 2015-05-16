Before do

    # Forces all threads to share the same connection. This works on
    # Capybara because it starts the web server in a thread.
    ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

end

Before('@signed_in') do
  @current_user = FactoryGirl.create(:entrepreneur_with_1_question)
  visit '/users/sign_in'
  fill_in "user_email", with: @current_user.email
  fill_in "user_password", with: @current_user.password
  click_button I18n.t(:sign_in, scope: [:devise, :sessions])
end

Before('@signed_in_lawyer') do
  @current_user = FactoryGirl.create(:lawyer)
  visit '/users/sign_in'
  fill_in "user_email", with: @current_user.email
  fill_in "user_password", with: @current_user.password
  click_button I18n.t(:sign_in, scope: [:devise, :sessions])
end
