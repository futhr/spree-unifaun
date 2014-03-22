require 'sinatra/base'

# Simulate: http://unifaun.se

class FakeUnifaun < Sinatra::Base

  get '/' do
    xml_response 200, 'shipment.xml'
  end

  private

  def xml_response(response_code, file_name)
    content_type :xml
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name).read
  end
end