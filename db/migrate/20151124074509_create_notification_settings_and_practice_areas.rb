class CreateNotificationSettingsAndPracticeAreas < ActiveRecord::Migration
  def change
     create_table :notification_settings_practice_areas, id: false do |t|  
      t.belongs_to :notification_setting
      t.belongs_to :practice_area
    end
    add_index :notification_settings_practice_areas, :notification_setting_id, name: "index_on_notification_setting_id"
    add_index :notification_settings_practice_areas, :practice_area_id, name: "index_on_practice_area_id"    
  end
end
