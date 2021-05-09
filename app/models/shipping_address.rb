class ShippingAddress < ApplicationRecord
  belongs_to :user
  belongs_to :purchase
  belongs_to :shipping_day
  belongs_to :shipping_address
  has_one :item
end
