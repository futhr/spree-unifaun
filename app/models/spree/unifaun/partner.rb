class Spree::Unifaun::Partner < ActiveRecord::Base
  self.table_name = :spree_unifaun_partner

  validates :code, :partner, presence: true
end
