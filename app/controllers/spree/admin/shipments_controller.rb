module Spree
  module Admin
    class ShipmentsController < BaseController

      def index
        @order = Order.includes(:shipments).where(number: params[:order_id]).first!
        authorize! :manage, @order
        @shipments = @order.shipments
      end

      def edit
        @order = Order.includes(:shipments).where(number: params[:order_id]).first!
        @shipment = @order.shipments.where(number: params[:id]).first!
      end
    end
  end
end