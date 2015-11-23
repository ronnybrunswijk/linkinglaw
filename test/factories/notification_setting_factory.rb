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

        trait :with_no_interval do
           interval { FactoryGirl.create(:never) }            
        end
        
        trait :with_daily_interval do
           next_point_in_time DateTime.current.beginning_of_hour
           interval { FactoryGirl.create(:daily) }            
        end
        
        trait :with_fryslan_region do
            after(:create) do |notification_setting|
                notification_setting.provinces = [FactoryGirl.create(:friesland)]
            end
            
        end
    end

    factory :notification_setting_empty, class: NotificationSetting do
    end
    
end

