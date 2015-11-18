class RemoveRegularityReferenceFromNotificationSetting < ActiveRecord::Migration
  def change
    remove_reference :notification_settings, :regularity, index: true    
  end
end
