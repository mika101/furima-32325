class UsersController < ApplicationControllerdef
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to controller: :users, action: :index
    else
      render "new"
    end
  end
  def update
  if current_user.update(user_params)
    redirect_to root_path
  else
    render :edit
  end
end

private

def user_params
  params.require(:user).permit(:name, :email)
end
end
