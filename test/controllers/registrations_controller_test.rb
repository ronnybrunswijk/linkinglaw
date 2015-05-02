require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  def test_valid_sign_up 
     post :create, { user: { email: "rocky.marciano@boxing.ko",
                             password: "uppercut",
                             confirmation_password: "uppercut" } }
     assert_redirected_to root_path
  end

  def test_sign_up_with_invalid_email
      post :create, { user: { email: "",
                              password: "uppercut",
                              confirmation_password: "uppercut" } }
      user = assigns(:user)
      refute user.valid?
      assert_template :new
  end     

  def test_valid_sign_up_ajax
     xhr :post, :create, { user: { email: "rocky.marciano@boxing.ko",
                             password: "uppercut",
                             confirmation_password: "uppercut" } }
     assert_response :success
  end   

  def test_sign_up_with_invalid_email_ajax
      xhr :post, :create, { user: { email: "",
                              password: "uppercut",
                              confirmation_password: "uppercut" } }
      body = JSON.parse @response.body
      assert_equal 'Ongeldig e-mail of wachtwoord.', body['error']
  end

end
