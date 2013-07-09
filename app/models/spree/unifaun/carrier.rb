class Spree::Unifaun::Carrier < ActiveRecord::Base
  self.table_name = :spree_unifaun_carrier
  belongs_to :carrier_service, class_name: 'Spree::Unifaun::CarrierService'
  attr_accessible :code, :name
  validates :code, :name, presence: true
end
