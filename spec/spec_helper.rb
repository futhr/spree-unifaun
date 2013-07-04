if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter
  ]
  SimpleCov.start do
    add_filter '/spec/'
    add_group 'Controllers', 'app/controllers'
    add_group 'Overrides', 'app/overrides'
    add_group 'Models', 'app/models'
    add_group 'Libraries', 'lib'
  end
end

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)

require 'rspec/rails'
require 'webmock/rspec'
require 'ffaker'
require 'database_cleaner'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

require 'spree/testing_support/factories'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/url_helpers'

RSpec.configure do |config|
  config.include Spree::TestingSupport::ControllerRequests
  config.include FactoryGirl::Syntax::Methods
  config.include Spree::TestingSupport::UrlHelpers

  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.fail_fast = ENV['FAIL_FAST'] || false

  config.before do
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end


require 'nokogiri'
RSpec::Matchers.define :have_xml do |xpath, text|
  match do |body|
    doc = Nokogiri::XML::Document.parse(body)
    nodes = doc.xpath(xpath)
    nodes.empty?.should be_false
    if text
      nodes.each do |node|
        node.content.should == text
      end
    end
    true
  end
 
  failure_message_for_should do |body|
    "expected to find xml tag #{xpath} in:\n#{body}"
  end
 
  failure_message_for_should_not do |response|
    "expected not to find xml tag #{xpath} in:\n#{body}"
  end
 
  description do
    "have xml tag #{xpath}"
  end
end