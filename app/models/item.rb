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
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_condition_id
      validates :burden_id
      validates :area_id
      validates :shipping_day_id
    end
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is out of setting range' }
  end

  belongs_to :user
  # has_one :purchase
  has_one_attached :image
end
