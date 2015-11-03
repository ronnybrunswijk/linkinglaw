class AddRegularityToNotificationSetting < ActiveRecord::Migration
  def change
    add_column :notification_settings, :regularity, :integer
  end
end
