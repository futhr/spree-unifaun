require 'spec_helper'
describe Spree::Unifaun::ShipmentController do
	
	let(:unifaun_shipment_controller) { Spree::Unifaun::ShipmentController.new(create(:shipment)) }

  context "#new" do 
  	it "prepares a unifaum-shipment from given Spree::Shipment object" do
  	 pending "TODO"
  	end 
	end

  context "#post" do       
  	it "notifies Unifaum Admin of a new Spree::Shipment" do
  		pending "TODO"
  	end
	end

  context "#get_status" do 
  	it "gets the status of a Spree::Shipment from Unifaum" do
		 pending "TODO"
		end
	end
  

  context "#to_xml" do 
  	it "has root element with the encoding ISO-8859-1" do
      xml = unifaun_shipment_controller.to_xml
      xml.should match(/encoding=\"ISO-8859-1\"/)
  	end

    describe ":receiver element:" do
    	it "should be present" do
    	  xml = unifaun_shipment_controller.to_xml
    	  xml.should match(/<receiver/)
    	end

      it "has the address's id as rcvid" do
        xml = unifaun_shipment_controller.to_xml
        address_id = unifaun_shipment_controller.address.id
        xml.should match(/<receiver rcvid=\"#{address_id}\"/) 
      end

      it "has name as Unifaun AB" do
        unifaun_shipment_controller.address.firstname = "Unifaun"
        unifaun_shipment_controller.address.lastname = "AB"
        xml = unifaun_shipment_controller.to_xml
        xml.should match(/<val n="name">Unifaun AB<\/val>/)
      end

      it "has address1 as 5, 7th avenue" do
        unifaun_shipment_controller.address.address1 = "5, 7th avenue"
        xml = unifaun_shipment_controller.to_xml
        xml.should match(/<val n="address1">5, 7th avenue<\/val>/)        
      end

      it "has address2 as Kaserntorget" do
        unifaun_shipment_controller.address.address2 = "Kaserntorget"
        xml = unifaun_shipment_controller.to_xml
        xml.should match(/<val n="address2">Kaserntorget<\/val>/)           
      end

      it "has zipcode as 97469" do
        unifaun_shipment_controller.address.zipcode = "97469"
        xml = unifaun_shipment_controller.to_xml
        xml.should match(/<val n="zipcode">97469<\/val>/)        
      end

      it "has city as BERLIN" do
        unifaun_shipment_controller.address.city = "BERLIN"
        xml = unifaun_shipment_controller.to_xml
        xml.should match(/<val n="city">BERLIN<\/val>/)        
      end

      it "has country as DE" do
        unifaun_shipment_controller.address.country.iso_name = "DE"
        xml = unifaun_shipment_controller.to_xml
        xml.should match(/<val n="country">DE<\/val>/)        
      end

      it "has email as support@unifaun.se" do
        unifaun_shipment_controller.order.user.email = "support@unifaun.se"
        xml = unifaun_shipment_controller.to_xml
        xml.should match(/<val n="email">support@unifaun.se<\/val>/)        
      end

      it "has phone as 031-725 35 00" do
        unifaun_shipment_controller.address.phone = "031-725 35 00"
        xml = unifaun_shipment_controller.to_xml
        xml.should match(/<val n="phone">031-725 35 00<\/val>/)        
      end

      it "has sms as 0700-000000" do
        pending "SPREE ADDRESS HAS NO SEPARATE MOBILE NO."
        xml = unifaun_shipment_controller.to_xml
        xml.should match(/<val n="sms">0700-000000<\/val>/)        
      end

      it "has contact as Support" do
        pending "SPREE ADDRESS HAS NO SEPARATE CONTACT PERSON"
        xml = unifaun_shipment_controller.to_xml
        xml.should match(/<val n="contact">Support<\/val>/)        
      end

    end

    describe ":shipment element:" do
    	it "should be present" do
    	  xml = unifaun_shipment_controller.to_xml
        xml.should match(/<shipment/)
    	end

      it "has the order's number as orderno" do
        xml = unifaun_shipment_controller.to_xml
        order_no = unifaun_shipment_controller.order.number
        xml.should match(/<shipment orderno=\"#{order_no}\"/)
      end
    end
  end	


  context "#save" do
    it "saves the unifaum-shipment to the database" do
    	pending "TODO"
    end
  end

  context "#unifaum_id" do 
  	it "gives the identifier of the shipment on Unifaum" do
  		pending "TODO"
  	end
  end


end
