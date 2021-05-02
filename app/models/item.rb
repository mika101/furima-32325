class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name
    validates :description_of_item 
    validates :category_id, numericality: { other_than: 1 } 
    validates :product_condition_id, numericality: { other_than: 1 } 
    validates :burden_id, numericality: { other_than: 1 } 
    validates :area_id, numericality: { other_than: 1 } 
    validates :shipping_day_id, numericality: { other_than: 1 } 
    validates :price,inclision: { in: 300..9999999 },format: { with: /\A[0-9]+\z/ }
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  belongs_to :category
  #validates :title, :text, presence: true
  #belongs_to :product_condition
  belongs_to :burden
  belongs_to :area
  belongs_to :shipping_day
 


end
