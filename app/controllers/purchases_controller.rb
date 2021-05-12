class PurchasesController < ApplicationController
  
  
   def index
    @purchase_information = PurchaseInformation.new
    @item = Item.find(params[:item_id])
   end

   def create
    #PurchaseInformation.create(purchase_information_params)
    # binding.pry
    @item = Item.find(params[:item_id])
    @purchase_information = PurchaseInformation.new(purchase_information_params)
    if @purchase_information.valid?
      @purchase_information.save
    redirect_to action: :index
    else
    render action: :index
    end
   end

   

 private

  def purchase_information_params
        params.require(:purchase_information).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :purchase)
        .merge(user_id: current_user.id, item_id: params[:item_id])
  end


end