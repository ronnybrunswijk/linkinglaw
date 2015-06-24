# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  role                   :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'test_helper'
require 'database_cleaner'

class UserTest < Minitest::Test

   def setup
     DatabaseCleaner.start
     @user = FactoryGirl.create(:entrepreneur_with_1_question)
     @lawyer = FactoryGirl.create(:lawyer)
     @lawyer_with_profile = FactoryGirl.create(:lawyer_with_profile)
     @entrepreneur = FactoryGirl.create(:entrepreneur)
     @admin = FactoryGirl.create(:admin)
   end

   def teardown
     DatabaseCleaner.clean
   end

   def test_user_question_association 
     refute_empty @user.questions
   end

   def test_user_profile_assocation
     refute_nil @lawyer_with_profile.profile
   end

   def test_lawyer_role
     assert_equal "lawyer", @lawyer.role
   end


   def test_lawyer_role
      assert_equal "entrepreneur", @entrepreneur.role
   end

   def test__role
      assert_equal "admin", @admin.role
   end

   def test_default_role
     default_user = User.create(name: "Cassius Clay",
                                email: "cassius.clay@boxing.ko",
                                password: "uppercut",
                                password_confirmation: "uppercut")
     assert_equal "entrepreneur", default_user.role
   end

   def test_roles_ordinal
     assert_equal 0, User.roles[:entrepreneur]
     assert_equal 1, User.roles[:lawyer]
     assert_equal 2, User.roles[:admin]
   end
end
