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

FactoryGirl.define do
    
    factory :notification_setting do
        interval { FactoryGirl.create(:immediately) }
        
        trait :with_daily_interval do
           next_point_in_time DateTime.current.beginning_of_hour
           interval { FactoryGirl.create(:daily) }            
        end
        
        trait :with_3daily_interval do
           next_point_in_time DateTime.current.beginning_of_hour            
           interval { FactoryGirl.create(:every_3_days) }            
        end
    end

    factory :notification_setting_empty, class: NotificationSetting do
    end
    
end

