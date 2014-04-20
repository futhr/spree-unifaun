require 'nokogiri'

module Spree
  module Unifaun
    class ShipmentHandler
      include HTTParty
      base_uri 'api.unifaun.com'
      format :xml

      attr_reader :shipment, :order, :address

      def initialize(shipment)
        @shipment = shipment
        @address  = shipment.address
        @order    = shipment.order
      end

      def post
        options = { body: self.to_xml }
        self.class.post('/shipment', options)
      end

      def get_status
        options = { orderno: @order.number }
        self.class.get('/tracker', options)
      end

      def to_xml
        Nokogiri::XML::Builder.new(encoding: 'ISO-8859-1') do |xml|
          xml.data do
            xml.receiver(rcvid: @address.id) do
              xml.val address_name,       n: :name
              xml.val @address.address1,  n: :address1
              xml.val @address.address2,  n: :address2
              xml.val @address.zipcode,   n: :zipcode
              xml.val @address.city,      n: :city
              xml.val country_iso,        n: :country
              xml.val order_email,        n: :email
              xml.val @address.phone,     n: :phone
            end
            xml.shipment(orderno: @order.number) do
              xml.val shipment_from,      n: :from
              xml.val shipment_to,        n: :to
              xml.val shipment_shipdate,  n: :shipdate
              xml.service '',             srvid: service_id
              xml.container(type: container_type) do
                xml.val container_copies, n: :copies
                xml.val container_weight, n: :weight
              end
            end
          end
        end.to_xml
      end

      def address_name
        [@address.firstname, @address.lastname].compact.join(' ')
      end

      def order_email
        @order.user.email
      end

      def country_iso
        @address.country.try(:iso_name)
      end

      def shipment_from
        Spree::Unifaun::Config.preferred_quick_id_for_sender
      end

      def shipment_to # ShipAddress#id
        @address.id
      end

      # Defines shipment date.
      # Printed on shipping documents.
      # The default value is the current date.
      def shipment_shipdate
        @shipment.created_at.to_date
      end

      def service_id
        Spree::Unifaun::Config.preferred_service
      end

      def container_type
        'parcel'
      end

      def container_copies
        1
      end

      def container_weight ## Variant#weight
        @shipment.to_package.weight
      end
    end
  end
end
