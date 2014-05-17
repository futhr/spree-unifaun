require 'sinatra/base'

RSpec.configure do |config|

  config.around(:each, :fake_endpoint) do |example|
    stub_request(:any, /unifaunonline.com/).to_rack(FakeUnifaun)
    example.run
  end
end
