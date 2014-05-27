$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jcrop_ahead/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jcrop_ahead"
  s.version     = JcropAhead::VERSION
  s.authors     = ["Artur Pañach"]
  s.email       = ["arturictus@gmail.com"]
  s.homepage    = "https://github.com/arturictus/jcrop_ahead"
  s.summary     = "adds jcrop 0.9.12 to your rails app, add any crop to your application  to any model"
  s.description = "TODO: Description of JcropAhead."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.5"

  s.add_development_dependency "sqlite3"
  s.add_dependency "carrierwave"
  s.add_dependency "mini_magick"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.test_files = Dir["spec/**/*"]
end
