class CreateSpreeUnifaunPartners < ActiveRecord::Migration
  def up
    create_table :spree_unifaun_partners do |t|
      t.string :code
      t.string :partner
    end

    add_index :spree_unifaun_partners, :code, unique: true
  end

  def down
    drop_table :spree_unifaun_partners
  end
end
