feature 'Admin Order Details', :js do
  stub_authorization!

  given(:order) do
    create(:order,
      state: 'complete',
      completed_at: '2011-02-01 12:36:15',
      number: 'R100')
  end

  context 'edit order page' do

    background { visit spree.edit_admin_order_path(order) }

    scenario 'has a link to shipments page' do
      pending 'probably broken hook or bad created product'
      expect(page).to have_link 'Shipments'
    end
  end
end
