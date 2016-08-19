class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      render json: @user.attributes.slice('id', 'username')
    else
      render json: "Can't find this user", status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end