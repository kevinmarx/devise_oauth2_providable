# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
spec_root = File.expand_path('..', __FILE__)
require File.expand_path("dummy/config/environment.rb",  spec_root)

require 'pry'
require 'rspec/rails'
require 'shoulda/matchers'
require 'factory_girl_rails'
require 'shoulda-kept-assign-to'
require 'database_cleaner'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

RSpec.configure do |config|
  # config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.before :suite do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner[:active_record].clean_with :truncation
  end

  config.before :each do
    DatabaseCleaner[:active_record].start
  end

  config.after :each do
    DatabaseCleaner[:active_record].clean
  end
end

Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }
ActiveRecord::Migrator.migrate(File.expand_path("dummy/db/migrate/", spec_root))
