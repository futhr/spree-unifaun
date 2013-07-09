module Spree
  module Admin
    class ShipmentsController < BaseController
      def index
        @order = Order.find_by_number!(params[:order_id], include: :shipments)
        authorize! :manage, @order
        @shipments = @order.shipments
      end

      def edit
        @order = Order.find_by_number!(params[:order_id], include: :shipments)
        @shipment = @order.shipments.find_by_number!(params[:id])
      end
    end
  end
end
