class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :post_code,         null: false
      t.integer   :region_id,         null: false
      t.string   :address_city,      null: false
      t.string   :address_street,    null: false
      t.string   :address_building 
      t.string   :phone_number,       null: false
      t.references    :order,        null: false, foreign_key: true
      t.timestamps
    end
  end
end


