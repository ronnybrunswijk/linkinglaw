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
    user = assigns(:user)
    assert_not_nil user
    assert_nil user.profile
  end

  def test_new_user_registration_path_for_lawyer
    get :new, type: "lawyer"
    assert_template :new
    user = assigns(:user)
    assert_not_nil user
    assert_equal "entrepreneur", user.role
    assert_not_nil user.profile
  end

  def test_signup_as_lawyer
     post :create, { user: { name: "Cicero",
                             email: "law@yer.com",
                             password: "password",
                             password_confirmation: "password",
                             profile_attributes: { name: "Marcus Tullius",
                                                   practice_area: "contracten" } } }
     assert_redirected_to root_path
     lawyer = User.find_by name: "Cicero"
     assert_not_nil lawyer
     assert_equal "lawyer", lawyer.role
     profile = lawyer.profile
     assert_not_nil lawyer.profile
     assert_equal "Marcus Tullius", profile.name
     assert_equal "contracten", profile.practice_area
  end
end
