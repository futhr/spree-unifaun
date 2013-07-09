class Spree::Unifaun::CarrierMethod < ActiveRecord::Base
  self.table_name = :spree_unifaun_carrier_method
  belongs_to :carrier_service, class_name: 'Spree::Unifaun::CarrierService'
  attr_accessible :code, :name
  validates :code, :name, presence: true
end
