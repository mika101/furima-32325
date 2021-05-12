class ShippingAddress < ApplicationRecord
  # include ActiveHash::Associations
  # has_one :area
  belongs_to :purchase

end
