class Item < ApplicationRecord
  validates :name, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :pay_for_shipping_id, presence: true
  validates :region_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true
  validates :user , presence: true
end
