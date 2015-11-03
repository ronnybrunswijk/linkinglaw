require 'test_helper'

class NotificationSettingTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'regularity association' do
      notification_setting = FactoryGirl.create(:notification_setting)
      refute_nil notification_setting.regularity
  end 
end
