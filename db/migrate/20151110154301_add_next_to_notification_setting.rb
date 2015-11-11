class AddNextToNotificationSetting < ActiveRecord::Migration
  def change
    add_column :notification_settings, :next, :datetime
  end
end
