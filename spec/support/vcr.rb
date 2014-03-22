require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|

  config.hook_into :webmock
  config.cassette_library_dir = 'spec/cassettes'
  config.default_cassette_options = { record: :all }
  config.configure_rspec_metadata!
  config.ignore_localhost = true

  # Put "<UNIFAUN_API_SECRET_ID>" in place of the actual API key in
  # our cassettes so we don't have to commit to source control.
  config.filter_sensitive_data('<UNIFAUN_API_SECRET_ID>') do
    #Spree::Unifaun::Config.consumer_id
  end

  # Log vcr events
  config.debug_logger = File.open('vcr.log', 'w+')
end

RSpec.configure do |config|

  config.before(:all) do
    WebMock.allow_net_connect!
  end

  config.around(:each, :vcr) do |example|
    name = example.metadata[:full_description]
      .gsub(described_class.to_s, '')
      .gsub(/(^\W+|\W+$)/, '')
      .split(/\s+/, 2)
      .join('/')
      .gsub(/[^\w\/]+/, '_')
      .insert(0, '/')
      .insert(0, described_class.to_s.downcase.underscore)

    # BUG: It do not parse / (slash) into folders :(
    VCR.use_cassette(name) do
      example.call
    end
  end
end