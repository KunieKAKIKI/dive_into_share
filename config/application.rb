require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module DiveIntoShare
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.available_locales = [:en, :ja]
    config.i18n.default_locale = :ja
    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'
    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
