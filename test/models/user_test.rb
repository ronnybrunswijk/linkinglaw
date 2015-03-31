require 'test_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

class UserTest < Minitest::Test

   def setup
     DatabaseCleaner.start
     @user = FactoryGirl.create(:user)
     @question = FactoryGirl.build(:question)
   end

   def test_user_question_association 
     assert_empty @user.questions
     @user.questions << @question
     refute_empty @user.questions
   end
 
   def teardown
     DatabaseCleaner.clean
   end

end
