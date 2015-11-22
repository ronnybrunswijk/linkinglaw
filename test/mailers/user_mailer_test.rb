require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

   def setup
       DatabaseCleaner.start
   end

   def teardown
       DatabaseCleaner.clean
   end

   test 'confirm question email for entrepeneur' do

        entrepreneur = FactoryGirl.create(:entrepreneur, :with_answered_question)
        question = entrepreneur.questions.first
        email = UserMailer.confirm_question(entrepreneur, question)

        assert_equal ['info@linkinglaw.nl'], email.from
        assert_equal [entrepreneur.email], email.to
        assert_equal 'Uw vraag is op LinkingLaw geplaatst', email.subject

   end

end
