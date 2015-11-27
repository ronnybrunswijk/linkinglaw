# == Schema Information
#
# Table name: notification_settings
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  next_point_in_time :datetime
#  interval_id        :integer
#
# Indexes
#
#  index_notification_settings_on_interval_id  (interval_id)
#  index_notification_settings_on_user_id      (user_id)
#

require 'test_helper'

class NotificationSettingTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'interval association' do
      notification_setting = FactoryGirl.create(:notification_setting)
      refute_nil notification_setting.interval
  end 
  
  test 'select lawyers to notify per interval' do
    
    FactoryGirl.create(:lawyer)
    FactoryGirl.create(:lawyer, :with_daily_notification)
    
    lawyers = NotificationSetting.select_lawyers_to_notify()
    
    assert_equal 1, lawyers.size
    refute_nil lawyers[0].notification_setting.next_point_in_time    

  end

  test 'select lawyers to notify with immediate interval' do
    
    lawyer_with_immediate_notification_interval = FactoryGirl.create(:lawyer)
    FactoryGirl.create(:lawyer, :with_daily_notification)
    FactoryGirl.create(:lawyer, :without_notification)
    
    lawyers = NotificationSetting.select_lawyers_to_notify_immediately()
    
    assert_equal 1, lawyers.size
    assert_equal [lawyer_with_immediate_notification_interval], lawyers    

  end

  
  test 'update next point in time for notification setting with daily interval' do
    
    notification_setting = FactoryGirl.create(:notification_setting, :with_daily_interval)
    old_next_point_in_time = notification_setting.next_point_in_time
    
    notification_setting.update_next_point_in_time
    
    new_next_point_in_time = notification_setting.next_point_in_time
    
    assert_equal old_next_point_in_time + 24.hours, new_next_point_in_time
    
  end
  
  test 'province association' do
    
    notification_setting = FactoryGirl.create(:notification_setting, :with_fryslan_region)
    
    assert_equal 1, notification_setting.provinces.size
    assert_equal "Friesland", notification_setting.provinces[0].name

  end

  test 'practice area association' do
    
    notification_setting = FactoryGirl.create(:notification_setting, :with_aansprakelijkheidsrecht)
    
    assert_equal 1, notification_setting.practice_areas.size
    assert_equal "Aansprakelijkheidsrecht", notification_setting.practice_areas[0].name

  end

end
