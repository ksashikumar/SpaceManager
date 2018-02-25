require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require "sprockets/railtie"
require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module SpaceManager
  class Application < Rails::Application
    config.load_defaults 5.1
    config.action_controller.action_on_unpermitted_parameters = :raise
    config.api_only = true
    config.eager_load_paths += Dir["#{config.root}/lib/"]
    config.autoload_paths   += Dir["#{config.root}/lib/"]
  end
end
