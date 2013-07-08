require 'spec_helper'

describe "Order shipments" do
  let(:shipment){ create(:shipment, number: 'H100')}
  let(:order){ shipment.order }

  context '[as Admin]' do
    stub_authorization!

    context "index page" do
      it "should say 'Order has no shipments' when order has no shipments" do
        order.shipments.clear
        visit spree.admin_order_shipments_path(order)
        page.should have_content "Order Has No Shipments"
      end
      
      it "should list existing shipments" do
        visit spree.admin_order_shipments_path(order)
        page.should have_content "H100"
      end
    end

    context "edit page" do
      it "should have a button for posting to Unifaun" do
        visit spree.edit_admin_order_shipment_path(order, shipment)
        page.should have_link "Post To Unifaun"
      end

      it "should have a button for getting status from Unifaun" do
        visit spree.edit_admin_order_shipment_path(order, shipment)
        page.should have_link "Get Unifaun Status"
      end
    end
  end  
end