FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    region_id { 2 }
    address_city { '東京都' }
    address_street { '1-1' }
    address_building{ '東京ハイツ' }
    phone_number { '09012345678' }
    
  end
end
