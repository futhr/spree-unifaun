require 'spec_helper'

describe Spree::Admin::ShipmentsController do

  let(:order){ create(:order) }
  let(:user){ order.user }

  context "#index" do
    stub_authorization!
    
    before do
      controller.stub :spree_current_user => user
    end

    it "should set shipments" do
      shipments = [create(:shipment, order: order), create(:shipment, order: order)]
      spree_get :index, order_id: order.number
      assigns[:shipments].should eq(shipments) 
    end
  end

  context "#edit" do
  end
end
