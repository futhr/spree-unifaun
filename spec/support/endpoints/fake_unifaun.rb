require 'sinatra/base'

# Simulate: http://unifaun.se

class FakeUnifaun < Sinatra::Base

  # -> post order.xml
  # <- get response created.xml
  #
  # Errors:
  #
  # 403 (logon failure).
  # 500 (reading problems) order.xml contains syntax errors.
  #
  post '/ufoweb/order' do
    xml_response 200, 'created.xml'
  end

  post '/shipment' do
    xml_response 200, 'order.xml'
  end

  get '/tracker' do
    xml_response 200, 'shipment.xml'
  end

  private

  def xml_response(response_code, file_name)
    content_type :xml
    status response_code
    File.open(Rails.root.join('spec', 'fixtures', file_name)).read
  end
end
