require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
     DatabaseCleaner.start
     @user = FactoryGirl.create(:entrepreneur)
     @request.env['devise.mapping'] = Devise.mappings[:user] 
  end

  def teardown 
     DatabaseCleaner.clean    
  end

  def test_valid_sign_in
     post :create, { user: { email: @user.email,
                             password: @user.password } }
     assert_redirected_to root_path
  end

  def test_sign_in_with_invalid_password
     post :create, { user: { email: @user.email,
                             password: "wrong password" } }
     assert_equal 'Ongeldig e-mail of wachtwoord.', flash[:alert]
     assert_template :new
  end

  def test_valid_sign_in_remote 
     xhr :post, :create, { user: { email: @user.email, 
                                   password: @user.password } }
     assert_response :success
  end

  def test_sign_in_remote_with_invalid_password
     xhr :post, :create, { user: { email: @user.email,
                                   password: "wrong password" } }
     assert_response :unauthorized
     assert_template 'devise/sessions/_errors'
  end
end
