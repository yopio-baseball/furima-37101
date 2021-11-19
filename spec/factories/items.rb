FactoryBot.define do
  
  factory :item do
      
      name          {"名前"}
      product_description    {"説明"}
      price           {2000}
      state_id  {2}
      pay_for_shipping_id         {2}
      region_id      {2}
      shipping_date_id         {2}
      category_id        {2}
      association :user

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/umamusume.png'), filename: 'umamusume.png')
      end
  end
 
end
