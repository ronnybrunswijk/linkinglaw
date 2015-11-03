class CreateNotificationSettings < ActiveRecord::Migration
  def change
    create_table :notification_settings do |t|

      t.timestamps
    end
  end
end
