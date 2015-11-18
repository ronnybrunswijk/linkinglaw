class AddIntervalReferenceToNotificationSetting < ActiveRecord::Migration
  def change
    add_reference :notification_settings, :interval, index: true
  end
end
