class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :category
   belongs_to :product_condition
   belongs_to :burden
   belongs_to :area
   belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description_of_item 
    validates :category_id, numericality: { other_than: 1 } 
    validates :product_condition_id, numericality: { other_than: 1 } 
    validates :burden_id, numericality: { other_than: 1 } 
    validates :area_id, numericality: { other_than: 1 } 
    validates :shipping_day_id, numericality: { other_than: 1 } 
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  # 
  #validates :title, :text, presence: true
  #
  # 
  # belongs_to :area
  # belongs_to :shipping_day

end
