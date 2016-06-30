SparkPostRails.configure do |c|
  c.api_key = Rails.application.secrets.email_provider_apikey
end
