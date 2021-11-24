class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :pay_for_shipping
  belongs_to :region
  belongs_to :shipping_date
   
   validates :image, presence: true
   validates :name, presence: true
   validates :product_description, presence: true
   validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :pay_for_shipping_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :price, numericality:{ with: /\A[0-9]+\z/, message: 'should be half-width numbers' }
   validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
   
   
   
end
