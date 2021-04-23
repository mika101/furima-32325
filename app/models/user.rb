class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
  validates :nickname
  validates :email, uniqueness: true
  validates :password,:password_confirmation, format: { with: /\A[a-zA-Z0-9]+\z/, message: '半角英数字混合で入力して下さい' }
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角で入力して下さい' }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角で入力して下さい' }
  validates :family_name_furigana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力して下さい' }
  validates :first_name_furigana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力して下さい' }
  validates :birthday
 end
end
