require 'test_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

class UserTest < Minitest::Test

   def setup
     DatabaseCleaner.start
     @user = FactoryGirl.create(:user)
   end

   def test_user_question_association 
     refute_empty @user.questions
   end
 
   def teardown
     DatabaseCleaner.clean
   end

end
