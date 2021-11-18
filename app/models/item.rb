class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :state, :pay_for_shipping, :region, :shipping_date

   validates :name, presence: true
   validates :product_description, presence: true
   validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :pay_for_shipping_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :price, presence: true
   validates :user , presence: true
end
