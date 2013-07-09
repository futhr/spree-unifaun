require 'spec_helper'

describe "Order Details" do
  stub_authorization!

  let(:order) { create(:order, state: "complete", completed_at: "2011-02-01 12:36:15", number: "R100") }

  context "edit order page" do
    before { visit spree.edit_admin_order_path(order) }

    it "has a link to shipments-page" do
      page.should have_link "Shipments"
    end
  end
end
