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
                             profile_attributes: { first_name: "Marcus Tullius",
                                                    last_name: "Cicero",
                                                    business_address: "Via della Salara Vecchia 5/6",
                                                    city: "Roma",
                                                    phone: "+39 06 0608",
                                                    profession: "Lawyer",
                                                    disciplinary_decision: "false",
                                                    years_of_work_experience: 10
                             } } }
     assert_redirected_to root_path
     lawyer = User.find_by name: "Cicero"
     assert_not_nil lawyer
     assert_equal "lawyer", lawyer.role
     profile = lawyer.profile
     assert_not_nil lawyer.profile
     assert_equal "Marcus Tullius", profile.first_name
     assert_equal "Cicero", profile.last_name
     assert_equal "Via della Salara Vecchia 5/6", profile.business_address
     assert_equal "Roma", profile.city
     assert_equal "+39 06 0608", profile.phone
     assert_equal "Lawyer", profile.profession
     assert_equal 10, profile.years_of_work_experience
     refute profile.disciplinary_decision
  end
end
