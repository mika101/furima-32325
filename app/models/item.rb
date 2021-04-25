class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to :genre
  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  belongs_to :status
  validates :title, :text, presence: true
  validates :status_id, numericality: { other_than: 1 } 

  belongs_to :burden
  validates :title, :text, presence: true
  validates :burden_id, numericality: { other_than: 1 } 

  belongs_to :area
  validates :title, :text, presence: true
  validates :area_id, numericality: { other_than: 1 } 

  belongs_to :shipping
  validates :title, :text, presence: true
  validates :shipping_id, numericality: { other_than: 1 } 

end
