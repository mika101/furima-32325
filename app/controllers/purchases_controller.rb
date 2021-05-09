class PurchasesController < ApplicationController
   def new
   @purchase_information = PurchaseInformation.new
   end
  
   def index
    @purchase_information = PurchaseInformation.all
    @item = Item.find(params[:item_id])
   end

   def create
    binding.pry
   end

   def show
   @purchase_information = PurchaseInformation.all
   @item = Item.find(item_params[:item_id])
   end

 private

  def purchase_information_params
    params.permit(:item_id, :user, :postal_code, :municipality, :address, :building_name, :prefecture_id, :purchase)
  end
end
