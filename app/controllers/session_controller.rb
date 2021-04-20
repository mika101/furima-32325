class SessionController < ApplicationController
  def new
    @login = Session.new
  end

  def create
    @login = Session.new(email: params[:session][:email], password: params[:session][:password])
    if @login.save && (@user = User.find_by(email: @login.email)) && @user.authenticate(@login.password)
      redirect_to users_path
    else
      render :new
    end
  end
end
