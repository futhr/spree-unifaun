class CreateSpreeUnifaunCarriers < ActiveRecord::Migration
  def change
    create_table :spree_unifaun_carriers do |t|
      t.string :code
      t.string :name
    end
    add_index :spree_unifaun_carriers, :code, unique: true
  end
end
