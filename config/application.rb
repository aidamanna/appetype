require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv.load

module Appetype
  class Application < Rails::Application
    config.autoload_paths << "#{Rails.root}/app/helpers"

    Dir["#{Rails.root}/app/controllers/*"].each { |file| config.autoload_paths << file }
    Dir["#{Rails.root}/app/services/*"].each { |file| config.autoload_paths << file }
    Dir["#{Rails.root}/app/queries/*"].each { |file| config.autoload_paths << file }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
