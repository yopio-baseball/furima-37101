require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'address_buildingは空でも保存できること' do
        @order_address.address_building = ''
        expect(@order_address).to be_valid
      end
     
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'region_idを選択していないと保存できないこと' do
        @order_address.region_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'address_cityが空だと保存できないこと' do
        @order_address.address_city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address city can't be blank")
      end
      it 'address_streetが空だと保存できないこと' do
        @order_address.address_city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address city can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @order_address.phone_number = '０８０２４３５５２５３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが9桁以下では購入できない' do
        @order_address.phone_number = "090123456"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid") 
      end
      it 'phone_numberが12桁以上では購入できない' do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid") 
      end
    end
  end
end
