require 'spec_helper'

feature 'Admin Order Shipments', :js do
  stub_authorization!

  given(:shipment) { create(:shipment, number: 'H100') }
  given(:order) { shipment.order }

  context '#index' do

    scenario 'say "Order has no shipments" when order has no shipments' do
      order.shipments.clear
      visit spree.admin_order_shipments_path(order)
      expect(page).to have_text 'Order Has No Shipments'.upcase
    end

    scenario 'list existing shipments' do
      visit spree.admin_order_shipments_path(order)
      expect(page).to have_text 'H100'
    end
  end

  context '#edit' do

    scenario 'has a button for posting to Unifaun' do
      visit spree.edit_admin_order_shipment_path(order, shipment)
      expect(page).to have_link 'Post To Unifaun'
    end

    scenario 'has a button for getting status from Unifaun' do
      visit spree.edit_admin_order_shipment_path(order, shipment)
      expect(page).to have_link 'Get Unifaun Status'
    end
  end
end
