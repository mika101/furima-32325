class PurchasesController < ApplicationController
  before_action :move_to_index

  def index
    @purchase_information = PurchaseInformation.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
    redirect_to root_path if @item.purchase.present?
  end

  def create
    # PurchaseInformation.create(purchase_information_params)
    #  binding.pry
    @item = Item.find(params[:item_id])
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
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_information_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  # 「ログアウト状態で、URLを直接入力して売却済み商品の商品情報編集ページへ遷移しようとすると、ログインページに遷移すること」
  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
