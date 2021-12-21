class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_address = ItemAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :product_category_id, :product_condition_id, :burden_of_shipping_charge_id, :prefecture_id, :days_to_ship_id, :selling_price).merge(user_id: current_user.id)
  end
end