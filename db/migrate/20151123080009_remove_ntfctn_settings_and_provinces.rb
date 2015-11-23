class RemoveNtfctnSettingsAndProvinces < ActiveRecord::Migration
  def change
    drop_table :ntfctn_settings_and_provinces
  end
end
