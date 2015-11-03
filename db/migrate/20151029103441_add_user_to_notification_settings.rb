class AddUserToNotificationSettings < ActiveRecord::Migration
  def change
    add_reference :notification_settings, :user, index: true
  end
end
