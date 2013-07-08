require 'spec_helper'

describe "Order Details" do
  let(:order) { create(:order, state: 'complete', completed_at: "2011-02-01 12:36:15", number: "R100") }

  context 'as Admin' do
    stub_authorization!

    before { visit spree.edit_admin_order_path(order) }

    context "edit order page" do
      it "should have a link to shipments-page" do
        click_link :Shipments
        page.should have_content("Shipments")    
      end
    end
  end 
end