class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_id, only: [:edit, :update, :destroy]

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
end

def edit
end

def update
  if @item.update(item_params)
    redirect_to item_path(@item)
  else
    render :edit
  end
end

def destroy
  @item.destroy
  redirect_to root_path
end

  private

def item_params
  params.require(:item).permit(:image, :item_name, :description_of_item, :category_id, :product_condition_id, :price,
                               :burden_id, :area_id, :shipping_day_id).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def check_id
  redirect_to root_path unless @item.purchase.present?
end
end