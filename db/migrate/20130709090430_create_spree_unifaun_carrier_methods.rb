class CreateSpreeUnifaunCarrierMethods < ActiveRecord::Migration
  def change
    create_table :spree_unifaun_carrier_methods do |t|
      t.string :code
      t.string :name
    end
    add_index :spree_unifaun_carrier_methods, :code, unique: true
  end
end
