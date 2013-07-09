class CreateUnifaunCarrierMethods < ActiveRecord::Migration
  def up
    create_table :spree_unifaun_carrier_methods do |t|
      t.string :code
      t.string :name
    end
    # add_index :spree_unifaun_carrier_methods, :code, unique: true
  end

  def down
    drop_table :spree_unifaun_carrier_methods
  end
end
