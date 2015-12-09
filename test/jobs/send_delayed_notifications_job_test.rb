require 'test_helper'

class SendDelayedNotificationsJobTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'send delayed notifications about new question to lawyers  ' do
      
      lawyer = FactoryGirl.create(:lawyer, :with_daily_notification)
      notification_setting = lawyer.notification_setting
      next_notification_time = DateTime.current.beginning_of_hour
      notification_setting.next_notification_time = next_notification_time
      FactoryGirl.create(:question)
      
      SendDelayedNotificationsJob.perform_async()

      notification_setting.reload
      assert_equal next_notification_time + 24.hours, notification_setting.next_notification_time
  end 
end
