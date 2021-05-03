class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  

  def new
    @item = Item.new
  end
  def index

  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description_of_item, :category_id, :product_condition_id, :price, :burden_id, :area_id, :shipping_day_id, :user_id).merge(user_id: current_user.id)
  end
  end

