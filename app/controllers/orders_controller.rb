class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    unless current_user.id == @item.user_id 
      redirect_to root_path
    
    end
  end

  def create
    
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)

   
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render "orders/index" 
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :region_id, :address_city, :address_street, :address_building, :phone_number, :order).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id 
      redirect_to root_path

    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
