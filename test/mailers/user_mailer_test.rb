require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

   def setup
       DatabaseCleaner.start
       @user = FactoryGirl.create(:entrepreneur_with_1_question)
       @lawyer = FactoryGirl.create(:lawyer_with_profile)
   end

   def test_confirm_question_email_for_entrepeneur

        question = @user.questions.first
        email = UserMailer.confirm_question(@user, question).deliver!

        assert_equal ['info@linkinglaw.nl'], email.from
        assert_equal [@user.email], email.to
        assert_equal 'Uw vraag is op LinkingLaw geplaatst', email.subject

   end
   
   def test_confirm_signup_mail_for_lawyer
   
   end

   def teardown
       DatabaseCleaner.clean
   end
end
