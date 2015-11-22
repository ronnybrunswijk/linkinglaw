require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase

   def setup
       DatabaseCleaner.start
   end

   def teardown
       DatabaseCleaner.clean
   end

   test 'lawyer notification about new question' do

        lawyer = FactoryGirl.create(:lawyer)
        question = FactoryGirl.create(:question)
        
        email = NotificationMailer.notify_lawyer(lawyer, question)
   
        assert_equal ['info@linkinglaw.nl'], email.from
        assert_equal [lawyer.email], email.to
        assert email.body.include? lawyer.profile.last_name
      
   end

   test 'notify entrepreneur about one of his questions has been answered' do

        entrepreneur = FactoryGirl.create(:entrepreneur, :with_answered_question)
        answer = entrepreneur.questions.first.answers.first
        lawyer = FactoryGirl.create(:lawyer)
        answer.user = lawyer
        
        email = NotificationMailer.notify_entrepreneur(answer)
   
        assert_equal ['info@linkinglaw.nl'], email.from
        assert_equal [entrepreneur.email], email.to
        assert email.body.include? lawyer.profile.last_name
      
   end   
end
