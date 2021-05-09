class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shippong_addresses do |t|
    t.string :postal_code, default: "", null: false
    t.string :prefecture_id, null: false
    t.string :municipality, default: "", null: false
    t.string :address, default: "", null: false
    t.string :building_name, default: ""
    t.string :phone_number, default: "", null: false
    t.references :purchase, null: false,  foreign_key: true
    t.timestamps
    end
  end
end
