module Spree
  module Unifaun
    class CarrierService < ActiveRecord::Base
      self.table_name = :spree_unifaun_carrier_services
      belongs_to :carrier, class_name: 'Spree::Unifaun::Carrier'
      validates :code, :service, presence: true
    end
  end
end
