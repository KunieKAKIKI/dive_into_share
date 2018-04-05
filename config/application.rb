require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module DiveIntoShare
  class Application < Rails::Application
    config.load_defaults 5.1

    config.rack_dev_mark.enable = !Rails.env.production?
  end
end
