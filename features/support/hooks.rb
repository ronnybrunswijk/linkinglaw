Before('@signed_in') do
  @user = FactoryGirl.create(:user)
  visit '/users/sign_in'
  fill_in "user_email", with: @user.email
  fill_in "user_password", with: @user.password
  click_button I18n.t(:sign_in, scope: [:devise, :sessions])
end
