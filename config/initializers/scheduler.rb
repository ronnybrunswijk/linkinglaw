require "sidekiq/scheduler"

Sidekiq.schedule = YAML.load_file(File.expand_path("#{Rails.root}/config/sidekiq.yml"))                                                                                                         