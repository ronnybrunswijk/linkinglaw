require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

   def setup
       DatabaseCleaner.start
       @entrepreneur = FactoryGirl.create(:user, :entrepreneur, :with_questions)
       @lawyer = FactoryGirl.create(:user, :lawyer, :with_profile)
   end

   def test_confirm_question_email_for_entrepeneur

        question = @entrepreneur.questions.first
        email = UserMailer.confirm_question(@entrepreneur, question).deliver!

        assert_equal ['info@linkinglaw.nl'], email.from
        assert_equal [@entrepreneur.email], email.to
        assert_equal 'Uw vraag is op LinkingLaw geplaatst', email.subject

   end
   
   def test_confirm_signup_mail_for_lawyer
   
   end

   def teardown
       DatabaseCleaner.clean
   end
end
