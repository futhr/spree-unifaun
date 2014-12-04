class CreateSpreeUnifaunCarrierServices < ActiveRecord::Migration
  def change
    create_table :spree_unifaun_carrier_services do |t|
      t.integer :carrier_id
      t.integer :carrier_method_id
      t.string  :code
      t.string  :service
    end
    add_index :spree_unifaun_carrier_services, :code, unique: true
  end
end
