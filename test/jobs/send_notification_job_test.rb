require 'test_helper'

class SendNotificationsJobTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'send notification about new question to lawyers  ' do
      
      FactoryGirl.create_list(:lawyer, 2)
      question = FactoryGirl.create(:question)
      
      SendNotificationJob.perform_async(question)
      # TODO dit noch afmeitsje
  end 
end
