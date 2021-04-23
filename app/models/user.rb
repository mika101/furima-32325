class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
  validates :nickname
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/, message: '半角英数字混合で入力して下さい' }
  validates :birthday
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角で入力して下さい' } do
  validates :family_name
  validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }do
  validates :family_name_furigana
  validates :first_name_furigana
 end
end
