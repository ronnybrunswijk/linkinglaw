class ChangeNextToNextPointInTime < ActiveRecord::Migration
  def change
    rename_column :notification_settings, :next, :next_point_in_time
  end
end
