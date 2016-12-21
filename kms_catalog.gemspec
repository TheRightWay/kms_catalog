$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kms/catalog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kms_catalog"
  s.version     = Kms::Catalog::VERSION
  s.authors     = ["Igor Petrov"]
  s.email       = ["garik.piton@gmail.com"]
  s.homepage    = "http://webgradus.ru"
  s.summary     = "Summary of Catalog."
  s.description = "Description of Catalog."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1"
  s.add_dependency 'friendly_id', '~> 5.0.0'
  s.add_dependency 'babosa'
  s.add_dependency 'carrierwave'

  s.add_development_dependency "sqlite3"
end