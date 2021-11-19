class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new]
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    
  end

  def create
    # Item.create(item_params)
    # @items = Item.order("created_at DESC")
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path  
    else
      render :new
    end 
  end

  private
  def item_params
    params.require(:item).permit(:name, :product_description, :category_id, :state_id, :pay_for_shipping_id, :region_id, :shipping_date_id, :price, :user, :image).merge(user_id: current_user.id )
  end
end

