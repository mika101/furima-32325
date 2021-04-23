require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it '全ての項目が記載されていれば登録できること' do
          expect(@user).to be_valid
        end
        it 'passwordが６文字以上の半角英数字混合であれば登録できること' do
          @user.password = '123abc'
          @user.password_confirmation = '123abc'
          expect(@user).to be_valid
        end
      end
      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailに@が含まれていない場合登録できないこと' do
          @user.save
          @user.email = 'test.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordが6文字以下であれば登録できないこと' do
          @user.password = '11aaa'
          @user.password_confirmation = '11aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordが英字のみでは登録できないこと' do
          @user.password = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end       
        it 'passwordが数字のみでは登録できないこと' do
          @user.password = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'family_nameがない場合は登録できないこと' do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it 'family_name_furiganaがない場合は登録できないこと' do
          @user.family_name_furigana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name furigana can't be blank")
        end

        it 'first_nameがない場合は登録できないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'first_name_furiganaがない場合は登録できないこと' do
          @user.first_name_furigana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name furigana can't be blank")
        end

        it 'birthdayがない場合は登録できないこと' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        # 本人確認カタカナ全角入力のテスト
        it 'family_nameが全角入力でなければ登録できないこと' do
          @user.family_name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name 全角で入力して下さい')
        end

        it 'first_nameが全角入力でなければ登録できないこと' do
          @user.first_name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name 全角で入力して下さい')
        end

        # 本人確認カタカナ全角入力のテスト
        it 'family_name_furiganaが全角カタカナでなければ登録できないこと' do
          @user.family_name_furigana = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name furigana 全角カタカナのみで入力して下さい')
        end

        it 'first_name_furiganaが全角カタカナでなければ登録できないこと' do
          @user.first_name_furigana = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name furigana 全角カタカナのみで入力して下さい')
        end
      end
    end
  end
end
