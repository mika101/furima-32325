class ItemsController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to controller: :users, action: :index
    else
      render 'new'
    end
  end
end
