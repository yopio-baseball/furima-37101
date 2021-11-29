require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
   
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまく行かない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'product_descriptionが空だと出品できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'stateが未選択だと出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を選択してください")
      end
      it 'pay_for_shippingが未選択だと出品できない' do
        @item.pay_for_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料を選択してください")
      end
      it 'regionが未選択だと出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'shipping_dateが未選択だと出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送の日数を選択してください")
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格半角数値で入力してください", "販売価格半角数値で入力してください", "販売価格の金額入力は設定範囲内で収めてください")
      end

      it '売価格は、¥300未満だと保存できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格の金額入力は設定範囲内で収めてください")
      end
      
      it '売価格は、¥9,999,999以上だと保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格の金額入力は設定範囲内で収めてください")
      end

      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格半角数値で入力してください")
      end
     
      it 'ユーザの情報が空だと保存ができない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
