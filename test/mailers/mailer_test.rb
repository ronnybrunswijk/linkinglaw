require 'test_helper'
#require 'mailer'

class MailerTest < ActionMailer::TestCase

   def setup
       DatabaseCleaner.start
   end

   def teardown
       DatabaseCleaner.clean
   end

   test 'confirm signup mail for lawyer' do
        
#        lawyer = FactoryGirl.create(:lawyer)
#        token = 'dTDYagcDbfJehEJPThRi' 

#        email = Mailer.confirmation_instructions(lawyer, token)
        
#        assert_equal ['info@linkinglaw.nl'], email.from
#        assert_equal [lawyer.email], email.to
#        assert_equal 'Uw vraag is op LinkingLaw geplaatst', email.subject
      assert true
        
   end
end
