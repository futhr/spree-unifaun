class CreateSpreeUnifaunPartners < ActiveRecord::Migration
  def change
    create_table :spree_unifaun_partners do |t|
      t.string :code
      t.string :partner
    end
    add_index :spree_unifaun_partners, :code, unique: true
  end
end
