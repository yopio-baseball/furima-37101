class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :address_city,  :address_street, :address_building, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン(-)を含めてください"}
    validates :region_id, numericality: {other_than: 1, message: "を選択してください"}
    validates :address_city
    validates :address_street
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "は半角数字、10桁11桁のみです"}
    validates :token
  end
  

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(post_code: post_code, region_id: region_id, address_city: address_city, address_street: address_street, address_building: address_building, phone_number: phone_number, order_id: order.id)
  end
end

