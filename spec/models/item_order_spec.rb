require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できる時'do
      it '全ての項目が入力されていれば購入ができる' do
        expect(@item_order).to be_valid
      end

      it '建物名がなくても保存できる' do
        @item_order.building_name = nil
        expect(@item_order).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'user_id（購入者）が空だと購入できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_id（購入商品）が空だと購入できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end

      it 'token(クレジットカード情報)が空だと購入ができない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      
      it '郵便番号が空だと購入ができない' do
        @item_order.postal_code = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと登録できない' do
        @item_order.postal_code = "12345678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. includes hyphen(-)")
      end

      it '郵便番号が8桁でないと購入できない' do
        @item_order.postal_code = "1235678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. includes hyphen(-)")
      end

      it 'prefecture_idが空だと購入できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'city_nameが空だと購入できない' do
        @item_order.city_name = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City name can't be blank")
      end

      it 'block_nameが空だと購入できない' do
        @item_order.block_name = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Block name can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @item_order.phone_number = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁でなければ購入できない' do
        @item_order.phone_number = "080123456789"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid. Phone number must be 10 to 11 digits")
      end

      it 'phone_numberが9桁以下では購入できない' do
        @item_order.phone_number = "080123456"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid. Phone number must be 10 to 11 digits")
      end
    end
  end
end