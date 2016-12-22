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
    end
  end
end
