require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

   def setup
       DatabaseCleaner.start
       @entrepreneur = FactoryGirl.create(:entrepreneur, :with_answered_question)
   end

   def teardown
       DatabaseCleaner.clean
   end

   test 'confirm question email for entrepeneur' do

        question = @entrepreneur.questions.first
        email = UserMailer.confirm_question(@entrepreneur, question).deliver!

        assert_equal ['info@linkinglaw.nl'], email.from
        assert_equal [@entrepreneur.email], email.to
        assert_equal 'Uw vraag is op LinkingLaw geplaatst', email.subject

   end

   test 'answer notification' do

        answer = @entrepreneur.questions.first.answers.first
        lawyer = FactoryGirl.create(:lawyer)
        answer.user = lawyer
        
        email = UserMailer.notify_entrepreneur(answer)
   
        assert_equal ['info@linkinglaw.nl'], email.from
        assert_equal [@entrepreneur.email], email.to
        assert email.body.include? lawyer.profile.last_name
      
   end
end
