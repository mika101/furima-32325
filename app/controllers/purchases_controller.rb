class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item 
  before_action :move_top_page

   def index
    @purchase_information = PurchaseInformation.new
  
  end

   def create
    @purchase_information = PurchaseInformation.new(purchase_information_params)
    if @purchase_information.valid?
      pay_item
      @purchase_information.save
      redirect_to root_path
    else
    render action: :index
    end
   end

 private

  def purchase_information_params
        params.require(:purchase_information).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :purchase, :price)
        .merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])

  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_information_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  def set_item
    @item = Item.find(params[:id])
  end

  def move_top_page
    @item = Item.find(params[:item_id])
  if current_user == @item.user || @item.purchase.present? 
    redirect_to root_path and return
  end
end
end