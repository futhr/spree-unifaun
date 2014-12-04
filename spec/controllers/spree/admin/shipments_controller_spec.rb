RSpec.describe Spree::Admin::ShipmentsController, type: :controller do
  stub_authorization!

  let!(:order) { create(:order) }
  let(:user)   { order.user }

  before { allow(controller).to receive(:spree_current_user).and_return(user) }

  context '#index' do
    it 'sets the shipments' do
      shipments = [create(:shipment, order: order), create(:shipment, order: order)]
      spree_get :index, order_id: order.number
      expect(assigns[:shipments]).to eq shipments
    end
  end
end
