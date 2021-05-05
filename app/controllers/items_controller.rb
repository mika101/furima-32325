class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]

  def new
    @item = Item.new
  end

  def index
    @items = Item.order('created_at DESC')
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description_of_item, :category_id, :product_condition_id, :price,
                                 :burden_id, :area_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  # 「ログイン状態で、URLを直接入力して売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移すること」
  # 「ログアウト状態で、URLを直接入力して売却済み商品の商品情報編集ページへ遷移しようとすると、ログインページに遷移すること」という機能に関しては、商品購入機能実装後に実装すること
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
