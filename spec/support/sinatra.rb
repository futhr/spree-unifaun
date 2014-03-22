require 'sinatra/base'

RSpec.configure do |config|

  config.around(:each, :fake_endpoint) do |example|
    stub_request(:any, /unifaun.se/).to_rack(FakeUnifaunn)

    example.run
  end
end