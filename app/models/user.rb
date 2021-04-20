class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: '半角英数字混合で入力して下さい' }
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_furigana, presence: true
  validates :first_name_furigana, presence: true
  validates :birthday, presence: true
  validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力して下さい' }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力して下さい' }
  validates :family_name_furigana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力して下さい' }
  validates :first_name_furigana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力して下さい' }
end
