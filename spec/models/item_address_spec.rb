require 'rails_helper'
RSpec.describe Address, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @address = FactoryBot.build(:item_address, user_id: user.id, item_id: item.id)

    sleep 0.5
  end

  describe '商品購入' do
    context '商品が購入できる時' do
      it '全ての値が存在すれば登録できる' do
        expect(@address).to be_valid
      end
      it '建物名以外全ての値が存在すれば登録できる' do
        @address.building_name = ''
        expect(@address).to be_valid
      end
    end
    context '商品が購入できない時' do
      it 'postal_codeが空では登録できない' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeにハイフンなしでは登録できない' do
        @address.postal_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it 'prefecture_idが空では登録できない' do
        @address.prefecture_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空では登録できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空では登録できない' do
        @address.address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Address can't be blank"
      end
      it 'telephone_numberが空では登録できない' do
        @address.telephone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Telephone number can't be blank"
      end
      it 'telephone_numberが12字以上で登録できない' do
        @address.telephone_number = '1111111111111'
        @address.valid?
        expect(@address.errors.full_messages).to include "Telephone number is too long"
      end
      it 'telephone_numberが9字以下で登録できない' do
        @address.telephone_number = '111111111'
        @address.valid?
        expect(@address.errors.full_messages).to include "Telephone number is too short"
      end
      it 'tokenが空では登録できない' do
        @address.token = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Token can't be blank"
      end
      it 'userが紐付いていなければ購入できない' do
        @address.user_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていなければ購入できない' do
        @address.item_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end