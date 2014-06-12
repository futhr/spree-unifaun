require 'simplecov'
require 'coveralls'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter 'spec'
  add_filter 'config'
  add_filter 'lib/spree_unifaun/engine'
  add_group  'Controllers', 'app/controllers'
  add_group  'Overrides', 'app/overrides'
  add_group  'Models', 'app/models'
  add_group  'Libraries', 'lib'
end

require 'dotenv'
Dotenv.load

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)

require 'rspec/rails'
require 'shoulda-matchers'
require 'ffaker'

ActiveRecord::Migration.check_pending!

RSpec.configure do |config|

  config.fail_fast = false
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.use_transactional_fixtures = false
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.raise_errors_for_deprecations!
  config.infer_spec_type_from_file_location!

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |file| require file }
