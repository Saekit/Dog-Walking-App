class SessionsController < ApplicationController

  def new
    @user = User.find_by(username: params[:username])
  end

  def create
    @user = User.find_by(username: params[:username])
    if params[:username].empty? || params[:password].empty?
      flash[:errors] = "username/password cannot be empty"
      redirect_to new_session_path
    else
      if @user && @user.authenticate(params[:password])
        log_in!(@user)
        redirect_to @user
      else
        flash[:errors] = "username/password does not match"
        redirect_to new_session_path
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to pages_welcome_path
  end
end
