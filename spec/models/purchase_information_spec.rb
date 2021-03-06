require 'rails_helper'

RSpec.describe PurchaseInformation, type: :model do
  describe Item do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_information = FactoryBot.build(:purchase_information, user_id: @user.id, item_id: @item.id)
      sleep 0.1  
    end
    describe '購入情報登録' do
      context '購入情報登録がうまくいくとき' do
        it '全ての項目が記載されていれば登録できること' do
          expect(@purchase_information).to be_valid
        end
        it 'building_nameは空でも保存できること' do
          @purchase_information.building_name = ''
          expect(@purchase_information).to be_valid
        end
      end
      context '購入情報登録がうまくいかないとき' do
        it 'postal_codeがない場合は登録できないこと' do
          @purchase_information.postal_code = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'area_idが空では登録できないこと' do
          @purchase_information.area_id = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include("Area can't be blank")
        end
        it 'municipalityが空だと保存できないこと' do
          @purchase_information.municipality = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include("Municipality can't be blank")
        end
        it 'addressが空だと保存できないこと' do
          @purchase_information.address = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include("Address can't be blank")
        end
        it 'phone_numberが空だと保存できないこと' do
          @purchase_information.phone_number = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'area_idが1だと保存できないこと' do
          @purchase_information.area_id = 1
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include('Area must be other than 1')
        end
        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @purchase_information.postal_code = '1234567'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include('Postal code is invalid')
        end
        it 'phone_numberが全角数字だと保存できないこと' do
          @purchase_information.phone_number = '１２３４５６７８９１２'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include('Phone number is invalid')
        end
        it 'phone_numberが12桁以上だと保存できないこと' do
          @purchase_information.phone_number = '123456789123'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include('Phone number is invalid')
        end
        it 'phone_numberが英数字混合だと保存できないこと' do
          @purchase_information.phone_number = 'aaaaa111111'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include('Phone number is invalid')
        end
        it 'tokenが空では登録できないこと' do
          @purchase_information.token = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが空では登録できないこと' do
          @purchase_information.user_id = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空では登録できないこと' do
          @purchase_information.item_id = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end
