module Spree
  module Unifaun
    class Partner < ActiveRecord::Base
      self.table_name = :spree_unifaun_partners
      validates :code, :partner, presence: true
    end
  end
end
