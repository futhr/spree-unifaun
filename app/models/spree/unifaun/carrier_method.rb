module Spree
  module Unifaun
    class CarrierMethod < ActiveRecord::Base
      self.table_name = :spree_unifaun_carrier_methods
      belongs_to :carrier_service, class_name: 'Spree::Unifaun::CarrierService'
      validates :code, :name, presence: true
    end
  end
end
