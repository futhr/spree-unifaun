class Spree::Unifaun::CarrierService < ActiveRecord::Base
  self.table_name = :spree_unifaun_carrier_service
  has_one :carrier, class_name: 'Spree::Unifaun::Carrier'
  has_one :carrier_method, class_name: 'Spree::Unifaun::CarrierMethod'
  attr_accessible :code, :service, :carrier_id, :carrier_method_id
  validates :code, :service, presence: true
end
