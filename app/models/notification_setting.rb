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

class NotificationSetting < ActiveRecord::Base
  belongs_to :interval
  
  def self.select_lawyers_to_notify()
      now = DateTime.now.beginning_of_hour
      User.joins(:notification_setting).where('notification_settings.next_point_in_time = ?', now)
  end

  def update_next_point_in_time()
      new_next_point_in_time = next_point_in_time + interval.hours.hours
      update_attribute(:next_point_in_time, new_next_point_in_time)
  end
end
