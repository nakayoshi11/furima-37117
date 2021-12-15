require 'rails_helper'
RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品できる時' do
      it '全ての値が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it 'product_descriptionが空では登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'product_category_idが空では登録できない' do
        @item.product_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Product category can't be blank"
      end
      it 'product_condition_idが空では登録できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Product condition can't be blank"
      end
      it 'burden_of_shipping_charge_idが空では登録できない' do
        @item.burden_of_shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden of shipping charge can't be blank"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'days_to_ship_idが空では登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it 'selling_priceが300円以下では登録できない' do
        @item.selling_price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price must be greater than or equal to 300"
      end
      it 'selling_priceが9999999円以上では登録できない' do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price must be less than or equal to 9999999"
      end
      it 'ユーザー情報なしでは商品登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end