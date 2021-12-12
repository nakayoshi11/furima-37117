require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全ての値が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailには「@」を含む必要があること' do
        @user.email = 'abc123gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'emailが他のユーザーと重複していると登録できないこと（一意性）' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'パスワードとパスワード（確認用）は値の一致が必須である' do
        @user.password = @user.encrypted_password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordは6文字以上での入力が必須である' do
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordは半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end
      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_nameが全角ひらがな漢字でなければ登録できない' do
        @user.last_name = 'Aa@:1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters"
      end
      it 'first_nameが全角ひらがな漢字でなければ登録できない' do
        @user.first_name = 'aA@:1'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'last_name_kanaがカナでなければ登録できない' do
        @user.last_name_kana = 'aAあ亜1:@'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters"
      end
      it 'first_name_kanaがカナでなければ登録できない' do
        @user.first_name_kana = 'aAあ亜1:@'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters"
      end
      it 'nicknameを登録できるとき' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
    end
  end
end