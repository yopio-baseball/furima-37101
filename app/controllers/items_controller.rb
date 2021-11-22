class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new, :edit]
before_action :set_item, only: [:edit, :show, :update, ]
  
def index
    @items = Item.all.order(created_at: :desc)
   
  end

  def new
    @item = Item.new
    
  end

  def create
    
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path  
    else
      render :new
    end 
  end

  def show
    
  end

  def edit
    
      unless current_user.id == @item.user.id 
        redirect_to root_path
      end
  end

  def update
   
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :product_description, :category_id, :state_id, :pay_for_shipping_id, :region_id, :shipping_date_id, :price, :image, ).merge(user_id: current_user.id )
  end
end

