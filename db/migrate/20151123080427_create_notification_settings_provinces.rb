class CreateNotificationSettingsProvinces < ActiveRecord::Migration
  def change
     create_table :notification_settings_provinces, id: false do |t|  
      t.belongs_to :notification_setting
      t.belongs_to :province
    end
    add_index :notification_settings_provinces, :notification_setting_id, name: "index_notification_setting_id"
    add_index :notification_settings_provinces, :province_id, name: "index_province_id"    
  end
end
