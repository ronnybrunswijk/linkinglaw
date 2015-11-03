class RemoveRegularityFromNotificationSetting < ActiveRecord::Migration
  def change
    remove_column :notification_settings, :regularity, :string
  end
end
