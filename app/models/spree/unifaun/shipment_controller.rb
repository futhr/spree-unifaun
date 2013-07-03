require 'nokogiri'

class Spree::Unifaun::ShipmentController
  include HTTParty
  base_uri 'api.unifaum.com'
  format :xml

  attr_reader :shipment, :order, :address

	def initialize(shipment)
		@shipment = shipment
		@address = shipment.address
		@order = shipment.order
	end	

	def post	
		options = {body: self.to_xml}
		self.class.post('/shipment', options)
	end

	def get_status
		options = {orderno: @order.number}
		self.class.get('/tracker', options)
	end

	def to_xml
		builder = Nokogiri::XML::Builder.new(encoding: "ISO-8859-1") do |xml|
			xml.data{
				xml.receiver(rcvid: @address.id){
					xml.val(address_name,         n: :name) 
					xml.val(@address.address1,    n: :address1) 
					xml.val(@address.address2,    n: :address2) 
					xml.val(@address.zipcode,     n: :zipcode)
					xml.val(@address.city,        n: :city)
					xml.val(country_iso,          n: :country)
					xml.val(order_email,          n: :email)
					xml.val(@address.phone,       n: :phone)
					xml.val("sms",                n: :sms)
					xml.val("contact",            n: :contact)
				}
				xml.shipment(orderno: @order.number){
					xml.from ""
				}
			}
		end 
		builder.to_xml
	end

	def address_name
		@address.firstname + " " + @address.lastname
	end

	def order_email
		@order.user.email
	end

	def country_iso
		@address.country.iso_name
	end


	
end