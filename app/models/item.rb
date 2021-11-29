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
  validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :state_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :pay_for_shipping_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :region_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :price, presence: true
  validates :price, numericality:{ with: /\A[0-9]+\z/, message: '半角数値で入力してください' }
  validates :price, format: { with: /\A[0-9]+\z/, message: "半角数値で入力してください" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "の金額入力は設定範囲内で収めてください" }
   
   
end
