require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  def test_valid_sign_up 
     post :create, { user: { email: "rocky.marciano@boxing.ko",
                             password: "uppercut",
                             password_confirmation: "uppercut" } }
     assert_redirected_to root_path
  end

  def test_sign_up_with_invalid_email
      post :create, { user: { email: "",
                              password: "uppercut",
                              password_confirmation: "uppercut" } }
      user = assigns(:user)
      refute user.valid?
      assert_template :new
  end     

  def test_valid_sign_up_ajax
     xhr :post, :create, { user: { email: "rocky.marciano@boxing.ko",
                             password: "uppercut",
                             password_confirmation: "uppercut" } }
     assert_response :success
  end   

  def test_sign_up_with_invalid_email_ajax
      xhr :post, :create, { user: { email: "",
                              password: "uppercut",
                              confirmation_password: "uppercut" } }
      assert_template 'devise/shared/_errors'
      assert_response :unauthorized    
  end

  def test_new_user_registration_path_for_entrepreneur
    get :new
    assert_template :new
    assert_nil assigns(:type)
  end

  def test_new_user_registration_path_for_lawyer
    get :new, type: "lawyer"
    assert_template :new
    assert_not_nil assigns(:type)
  end

end
