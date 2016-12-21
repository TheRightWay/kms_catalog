$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kms/catalog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kms_catalog"
  s.version     = Kms::Catalog::VERSION
  s.authors     = ["Igor Petrov"]
  s.email       = ["info@webgradus.ru"]
  s.homepage    = "http://webgradus.ru"
  s.summary     = "Provides catalog functionality for KMS website - Categories, Products, Variants"
  s.description = "Provides catalog functionality for KMS website - Categories, Products, Variants"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0.0"
  s.add_dependency 'kms', ">= 0.6.0"
  s.add_dependency 'friendly_id', '~> 5.0'
  s.add_dependency 'babosa'
  s.add_dependency 'carrierwave'

  s.add_development_dependency "sqlite3"
end
