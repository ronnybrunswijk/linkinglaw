require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

   def setup
       DatabaseCleaner.start
       @user = FactoryGirl.create(:entrepreneur_with_1_question)
   end

   def test_confirm_email

        question = @user.questions.first
        email = UserMailer.confirm_question(@user, question).deliver!

        assert_equal ['info@linkinglaw.nl'], email.from
        assert_equal [@user.email], email.to
        assert_equal 'Uw vraag is op LinkingLaw geplaatst', email.subject

   end

   def teardown
       DatabaseCleaner.clean
   end
end
