Capybara.asset_host = 'http://localhost:3000'
Capybara.configure do |config|
    config.app_host   = 'http://127.0.0.1'
    config.server_port = 3000
end
