class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new]
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    paramas.require(:item).permit(:name, :product_description, :category_id, :state_id, :pay_for_shipping_id, :region_id, :shipping_date_id, :price, :user, :image).merge(user_id: current_user.id )
  end
end

