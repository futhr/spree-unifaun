class CreateSpreeUnifaunCarrierServices < ActiveRecord::Migration
  def up
    create_table :spree_unifaun_carrier_services do |t|
      ## will break import_carrier_services
      ## => unknown attribute: carrier_id
      # t.references :spree_unifaun_carriers
      # t.references :spree_unifaun_carrier_methods
      t.integer :carrier_id
      t.integer :carrier_method_id
      t.string  :code
      t.string  :service
    end

    add_index :spree_unifaun_carrier_services, :code, unique: true
    # add_index :spree_unifaun_carrier_services, [:carrier_id, :carrier_method_id],
    #           name: 'spree_unifaun_carrier_service_join_index',
    #           unique: true
  end

  def down
    drop_table :spree_unifaun_carrier_services
  end
end
