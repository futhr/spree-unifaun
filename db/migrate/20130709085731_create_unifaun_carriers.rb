class CreateUnifaunCarriers < ActiveRecord::Migration
  def up
    create_table :spree_unifaun_carriers do |t|
      t.string :code
      t.string :name
    end
    # add_index :spree_unifaun_carriers, :code, unique: true
  end

  def down
    drop_table :spree_unifaun_carriers
  end
end
