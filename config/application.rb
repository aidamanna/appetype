require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv.load

module Appetype
  class Application < Rails::Application
    config.autoload_paths << "#{Rails.root}/app/helpers"
    config.autoload_paths << "#{Rails.root}/app/services"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
