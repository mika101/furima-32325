class Session < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :email, :password
  with_options presence: true do
  validates :email, uniqueness: true
  validates :password,:password_confirmation, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/, message: '半角英数字混合で入力して下さい' }
  end

  def save
    return false if invalid?

    true
  end
end
