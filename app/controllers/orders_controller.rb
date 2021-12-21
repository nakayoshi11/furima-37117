class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create, :move_to_index]
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @item_address = ItemAddress.new
  end

  def create
    @item_address = ItemAddress.new(address_params)
    if @item_address.valid?

      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        
        amount: @item.selling_price,
        card: address_params[:token], 
        currency: 'jpy'
      )
      @item_address.save
      redirect_to root_path
    else
      render :index
    end
end

  private

  def address_params
    params.require(:item_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.purchase_history
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end