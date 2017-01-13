require "friendly_id"
module Kms
  module Catalog
    class Engine < ::Rails::Engine
      engine_name 'kms_catalog'
      isolate_namespace Kms::Catalog
      config.eager_load_paths += Dir["#{config.root}/lib/**/"]
      config.to_prepare do
        Dir.glob(Rails.root + "**/*_decorator*.rb").each do |c|
          require_dependency(c)
        end
      end
      config.generators do |g|
        g.test_framework :rspec, fixture: false
        g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      end
    end
  end
end
