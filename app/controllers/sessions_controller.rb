class SessionsController < ApplicationController
  
  
  
  def new
  @user = User.new
  end

  def create
   reset_session
  user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to user_url
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, :notice => "Logged Out!"
  end
  
   private

    def user_params
      params.require(:user).permit(:password, :username)
    end
end
