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

class NotificationSetting < ActiveRecord::Base
  belongs_to :regularity
  
  def self.select_lawyers_to_notifiy()
      
      regularity_ids = Regularity.where.not(name: 'Meteen').pluck(:id)
      User.joins(:notification_setting).where('notification_settings.regularity_id in (?)', regularity_ids)

  end
  
end
