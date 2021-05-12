class PurchaseInformation
  
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :area_id, :municipality, :address, :building_name, :purchase, :phone_number, :purchase_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :address, format: { with: /\A[0-9]+\z/ }
    validates :building_name
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :user_id
    validates :item_id
     with_options numericality: { other_than: 1 } do
     validates :area_id
     end
  end
  
  def save
        # ユーザーの情報を保存し、「user」という変数に入れている
    purchase = Purchase.create(item_id:item_id, user_id:user_id)
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
    #Purchase.create(item_id: item.id, user_id: user.id)
  end


end


# テーブル名の修正。shippongになってしまっている。
# purchaseInformationのテーブルは不要なので削除する
# コントローラーのストロングパラメーターを編集してuser_idを受け取れるようにする。item_paramsを参考に。