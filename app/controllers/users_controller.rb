class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @owners = Owner.all
    @walkers = Walker.all
    current_user = User.find_by_id(session[:current_user_id])
  end

  def new
    @errors = flash[:errors] || []
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in!(@user)
      case @user.role
      when "owner"
        redirect_to new_owner_path
      when "walker"
        redirect_to new_walker_path
      when "admin"
        redirect_to user_path(@user)
      end
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end


  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :username, :role, :password)
  end

end
