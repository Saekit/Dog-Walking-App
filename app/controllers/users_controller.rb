class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @owner = User.owner
    @walker = User.walker
    current_user = User.find_by_id(session[:current_user_id])
  end

  def new
    @errors = flash[:errors] || []
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      case @user.role
      when "owner"
        redirect_to new_owner_path
      when "walker"
        redirect_to new_walker_path
      when "admin"
        redirect_to users_path
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

    respond_to do |format|
      format.html { redirect_to @users, notice: "You have successfully deleted your user profile 🤓"}
    end
  end


  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :username, :role, :password)
  end

end
