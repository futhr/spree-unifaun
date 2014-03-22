require 'spec_helper'

describe Spree::Admin::ShipmentsController do
  stub_authorization!

  let(:order) { create(:order) }
  let(:user)  { order.user }

  before { controller.stub spree_current_user: user }

  context '#index' do
    it 'set shipments' do
      shipments = [create(:shipment, order: order), create(:shipment, order: order)]
      spree_get :index, order_id: order.number
      expect(assigns[:shipments]).to eq shipments
    end
  end
end
