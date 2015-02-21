# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "devise/oauth2_providable/version"

Gem::Specification.new do |spec|
  spec.name        = "devise_oauth2_providable"
  spec.version     = Devise::Oauth2Providable::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ["Ryan Sonnek"]
  spec.email       = ["ryan@socialcast.com"]
  spec.homepage    = ""
  spec.summary     = %q{OAuth2 Provider for Rails applications}
  spec.description = %q{Rails3 engine that adds OAuth2 Provider support to any application built with Devise authentication}

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "> 4.0.0"
  spec.add_dependency "devise"
  spec.add_dependency "rack-oauth2"

  spec.add_development_dependency 'rspec-rails', "~> 2.14.2"
  # spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'shoulda-kept-assign-to'
  spec.add_development_dependency "database_cleaner", "~> 1.3.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "factory_girl_rails"
end
