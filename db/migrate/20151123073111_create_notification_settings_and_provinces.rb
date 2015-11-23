class CreateNotificationSettingsAndProvinces < ActiveRecord::Migration
  def change
     create_table :ntfctn_settings_and_provinces, id: false do |t|  # ntfctn otherwise index name will be too long
      t.belongs_to :notification_setting, index: true
      t.belongs_to :province, index: true 
    end
  end
end
