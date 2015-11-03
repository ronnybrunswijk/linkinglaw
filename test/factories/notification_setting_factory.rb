# == Schema Information
#
# Table name: notification_settings
#
#  id            :integer          not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#  regularity_id :integer
#
# Indexes
#
#  index_notification_settings_on_regularity_id  (regularity_id)
#  index_notification_settings_on_user_id        (user_id)
#

FactoryGirl.define do
    
    factory :notification_setting do
        regularity { FactoryGirl.create(:immediately) }
    end
    
    factory :notification_setting_empty, class: NotificationSetting do
    end
    
end

