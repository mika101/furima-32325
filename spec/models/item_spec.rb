require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '出品情報登録' do
      context '出品情報登録がうまくいくとき' do
        it '全ての項目が記載されていれば登録できること' do
          expect(@item).to be_valid
        end
        it '価格が300~9999999であれば登録できること' do
          @item.price = '9999999'
          expect(@item).to be_valid
        end
      end
      context '出品情報登録がうまくいかないとき' do
        it 'imageがない場合はは登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'item_nameが空では登録できないこと' do
          @item.item_name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it 'description_of_itemが空だと保存できないこと' do
          @item.description_of_item = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description of item can't be blank")
        end
        it 'category_idが空だと保存できないこと' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'product_condition_idが空だと保存できないこと' do
          @item.product_condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product condition can't be blank")
        end
        it 'priceが空だと保存できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが全角数字だと保存できないこと' do
          @item.price = '２０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range')
        end
        it 'priceが300円未満では保存できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range')
        end
        it 'priceが10,000,000円を超過すると保存できないこと' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range')
        end
        it 'burden_idが空だと保存できないこと' do
          @item.burden_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Burden can't be blank")
        end
        it 'area_idが空だと保存できないこと' do
          @item.area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank")
        end
        it 'shipping_day_idが空だと保存できないこと' do
          @item.shipping_day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day can't be blank")
        end
        it 'category_idが1だと保存できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it 'product_condition_idが1だと保存できないこと' do
          @item.product_condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Product condition must be other than 1")
        end
        it 'burden_idが1だと保存できないこと' do
          @item.burden_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Burden must be other than 1")
        end
        it 'area_idが1だと保存できないこと' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 1")
        end
        it 'shipping_day_idが1だと保存できないこと' do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
        end
        it 'userが紐付いていないと保存できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end
