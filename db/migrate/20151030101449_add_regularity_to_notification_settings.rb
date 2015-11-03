class AddRegularityToNotificationSettings < ActiveRecord::Migration
  def change
    add_reference :notification_settings, :regularity, index: true
  end
end
