class RenameNextPointInTimeToNextNotificationTime < ActiveRecord::Migration
  def change
    rename_column :notification_settings, :next_point_in_time, :next_notification_time  
  end
end
