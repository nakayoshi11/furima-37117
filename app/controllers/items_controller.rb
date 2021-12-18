class ItemsController < ApplicationController
  before_action :move_to_index, only: [:edit]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def create
      @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
end

private

def item_params
  params.require(:item).permit(:image, :product_name, :product_description, :product_category_id, :product_condition_id, :burden_of_shipping_charge_id, :prefecture_id, :days_to_ship_id, :selling_price).merge(user_id: current_user.id)
end

def move_to_index
  @item = Item.find(params[:id])
unless
  redirect_to action: :index
end
end