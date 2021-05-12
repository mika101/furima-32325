require 'rails_helper'

RSpec.describe PurchaseInformation, type: :model do
  describe Item do
    before do
      @purchase_information = FactoryBot.build(:purchase_information)
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
          expect(@purchase_information.errors.full_messages).to include("Area must be other than 1")
        end
        it 'purchaseが紐付いていないと保存できないこと' do
          @purchase_information.purchase_id = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include()
        end
        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @purchase_information.postal_code = '1234567'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include("Postal code is invalid")
        end
        it 'phone_numberが全角数字だと保存できないこと' do
          @purchase_information.phone_number = '１２３４５６７８９１２'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include("Phone number is invalid")
        end
      end
    end

  end
end
