class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden_of_shipping_charge
  belongs_to :product_category
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :product_condition
  has_one_attached :image

  validates :image, :product_name, presence: true
  validates :selling_price, length: { minimum: 300, maximum: 9999999 }
  validates :burden_of_shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :product_category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank" }
end