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
end
