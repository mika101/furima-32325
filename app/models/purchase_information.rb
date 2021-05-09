class PurchaseInformation < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :municipality, :address, :building_name, :prefecture_id, :purchase

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :address, format: { with: /\A[0-9]+\z/ }
    validates :building_name
    validates :phone_number, format: { with: /\A\d{11}\z/ }

     with_options numericality: { other_than: 1 } do
      validates :prefecture_id
     end
  end

    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture.id, municipality: municipality, address: address, building_name: building_name, user_id: user.id)
    Purchase.create(item: item.id, user: user.id)
  
  belongs_to :user
  belongs_to :item
  belongs_to :shipping_address
  belongs_to :purchase

end
