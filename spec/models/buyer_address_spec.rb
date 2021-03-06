require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    buyer = FactoryBot.create(:buyer)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: buyer.user_id, item_id: buyer.item_id)
    sleep(0.1)
  end

  describe '商品購入機能' do
    context '購入情報を保存できるとき' do
      it 'postal_code, region_id, city, address_line, phone_number, user_id, item_id, tokenが存在すれば保存できる' do
        expect(@buyer_address).to be_valid
      end
      it 'apartmentが空でも保存できる' do
        @buyer_address.apartment = nil
        expect(@buyer_address).to be_valid
      end
    end

    context '購入情報を保存できないとき' do
      it 'postal_codeが空では保存できない' do
        @buyer_address.postal_code = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'region_idが空では保存できない' do
        @buyer_address.region_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空では保存できない' do
        @buyer_address.city = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("市町村区を入力してください")
      end
      it 'address_lineが空では保存できない' do
        @buyer_address.address_line = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では保存できない' do
        @buyer_address.phone_number = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'user_idが空では保存できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では保存できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'tokenが空では保存できない' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'phone_numberに数値以外が含まれていると保存できない' do
        @buyer_address.phone_number = '000-1234-5678'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが12桁以上では保存できない' do
        @buyer_address.phone_number = '123456789012'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'region_idが1では登録できない' do
        @buyer_address.region_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
    end
  end
end
