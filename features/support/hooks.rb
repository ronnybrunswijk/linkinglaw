Before do

    # Forces all threads to share the same connection. This works on
    # Capybara because it starts the web server in a thread.
    ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

end

Before('@signed_in') do
  @user = FactoryGirl.create(:user)
  visit '/users/sign_in'
  fill_in "user_email", with: @user.email
  fill_in "user_password", with: @user.password
  click_button I18n.t(:sign_in, scope: [:devise, :sessions])
end

