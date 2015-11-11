# == Schema Information
#
# Table name: notification_settings
#
#  id            :integer          not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#  regularity_id :integer
#  next          :datetime
#
# Indexes
#
#  index_notification_settings_on_regularity_id  (regularity_id)
#  index_notification_settings_on_user_id        (user_id)
#

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
  
  test 'select lawyers to notify per interval' do
    
    FactoryGirl.create(:lawyer)
    FactoryGirl.create(:lawyer, :with_daily_notification)
    FactoryGirl.create(:lawyer, :with_3daily_notification)    
    
    lawyers = NotificationSetting.select_lawyers_to_notifiy()
    regularities = Regularity.where.not(name: 'Meteen')
    
    assert_equal 2, lawyers.size
    lawyers.each do |lawyer|
      assert regularities.include? lawyer.notification_setting.regularity 
    end
  end
  
  
  
end
