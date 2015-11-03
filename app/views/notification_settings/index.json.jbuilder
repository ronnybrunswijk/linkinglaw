json.array!(@notification_settings) do |notification_setting|
  json.extract! notification_setting, :id
  json.url notification_setting_url(notification_setting, format: :json)
end
