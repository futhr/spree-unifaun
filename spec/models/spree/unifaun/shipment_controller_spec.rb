require 'spec_helper'
describe Spree::Unifaun::ShipmentController do
	
	let(:unifaun_shipment_controller) { Spree::Unifaun::ShipmentController.new(create(:shipment)) }

  context "#post" do       
  	it "notifies Unifaun of a new Spree::Shipment" do
  		pending "TODO"
  	end
	end

  context "#get_status" do 
  	it "gets the status of a Spree::Shipment from Unifaun" do
		 pending "TODO"
		end
	end
  
  context "#to_xml" do 
  	it "has root element with the encoding ISO-8859-1" do
      unifaun_shipment_controller.to_xml.should match(/encoding=\"ISO-8859-1\"/)
  	end

    describe "<receiver> element: " do
    	it "should be present" do
        unifaun_shipment_controller.to_xml.should have_xml("/data/receiver")
    	end

      it "has the address's id as rcvid" do
        address_id = unifaun_shipment_controller.address.id
        unifaun_shipment_controller.to_xml.should have_xml("/data/receiver[@rcvid=#{address_id}]")
      end

      it "has name as Unifaun AB" do
        unifaun_shipment_controller.address.firstname = "Unifaun"
        unifaun_shipment_controller.address.lastname = "AB"
        unifaun_shipment_controller.to_xml.should have_xml('/data/receiver/val[@n="name"]', "Unifaun AB")
      end

      it "has address1 as 5, 7th avenue" do
        unifaun_shipment_controller.address.address1 = "5, 7th avenue"
        unifaun_shipment_controller.to_xml.should have_xml('/data/receiver/val[@n="address1"]', "5, 7th avenue")        
      end

      it "has address2 as Kaserntorget" do
        unifaun_shipment_controller.address.address2 = "Kaserntorget"
        unifaun_shipment_controller.to_xml.should have_xml('/data/receiver/val[@n="address2"]', "Kaserntorget")
      end

      it "has zipcode as 97469" do
        unifaun_shipment_controller.address.zipcode = "97469"
        unifaun_shipment_controller.to_xml.should have_xml('/data/receiver/val[@n="zipcode"]', "97469")
      end

      it "has city as BERLIN" do
        unifaun_shipment_controller.address.city = "BERLIN"  
        unifaun_shipment_controller.to_xml.should have_xml('/data/receiver/val[@n="city"]', "BERLIN")
      end

      it "has country as DE" do
        unifaun_shipment_controller.address.country.iso_name = "DE"
        unifaun_shipment_controller.to_xml.should have_xml('/data/receiver/val[@n="country"]', "DE")
      end

      it "has email as support@unifaun.se" do
        unifaun_shipment_controller.order.user.email = "support@unifaun.se"
        unifaun_shipment_controller.to_xml.should have_xml('/data/receiver/val[@n="email"]', "support@unifaun.se")
      end

      it "has phone as 031-725 35 00" do
        unifaun_shipment_controller.address.phone = "031-725 35 00"
        unifaun_shipment_controller.to_xml.should have_xml('/data/receiver/val[@n="phone"]', "031-725 35 00")
      end

    end

    describe "<shipment> element: " do
    	it "should be present" do
        unifaun_shipment_controller.to_xml.should have_xml '/data/shipment'
    	end

      it "has the order's number as orderno" do
        order_no = unifaun_shipment_controller.order.number
        unifaun_shipment_controller.to_xml.should have_xml "/data/shipment[@orderno=\"#{order_no}\"]"
      end

      it "has *from* as 123 - the sender's quick id" do
        Spree::Unifaun::Config.preferred_quick_id_for_sender=123
        unifaun_shipment_controller.to_xml.should have_xml '/data/shipment/val[@n="from"]', 
          "123"
      end

      it "has *to* as the ship-address id" do
        unifaun_shipment_controller.to_xml.should have_xml '/data/shipment/val[@n="to"]', 
          unifaun_shipment_controller.address.id.to_s
      end

      it "has *shipdate* as 2013-07-01 when the shipments is created-at 2013-07-01" do
        unifaun_shipment_controller.shipment.created_at = DateTime.parse("2013-07-01")
        unifaun_shipment_controller.to_xml.should have_xml '/data/shipment/val[@n="shipdate"]', 
          "2013-07-01"
      end

      describe "<service> element: " do

        it "should be present" do
          unifaun_shipment_controller.to_xml.should have_xml '/data/shipment/service'
        end

        it "has the 'srvid' as APL when chosen service is APL" do
          Spree::Unifaun::Config.preferred_service = "APL"
          unifaun_shipment_controller.to_xml.should have_xml '/data/shipment/service[@srvid="APL"]'
        end

      end

      describe "<container> element: " do
        it "should be present" do
          unifaun_shipment_controller.to_xml.should have_xml '/data/shipment/container'
        end

        it "has the 'type' as 'parcel'" do
          unifaun_shipment_controller.to_xml.should have_xml '/data/shipment/container[@type="parcel"]'
        end

        it "has copies as 1 when there is one parcel in the package" do
          unifaun_shipment_controller.to_xml.should have_xml '/data/shipment/container/val[@n="copies"]', "1"
        end

        it "has weight as 4 when there are two items in the order of weight 2kg each" do
          pending "WIP"
          unifaun_shipment_controller.to_xml.should have_xml '/data/shipment/container/val[@n="weight"]', "4"
        end

      end

    end
  end	


end
