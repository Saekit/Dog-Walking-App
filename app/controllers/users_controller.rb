class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @owner = User.owner
    @walker = User.walker
  end

  def new
    @errors = flash[:errors] || []
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    respond_to do |format|
      if @user.valid?
        @user.save!
        format.html {redirect_to @user, notice: "You have successfully created a user😎"}
      else
        format.html {render :new}
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)

    respond_to do |format|
      if @user.valid?
        @user.save!
        format.html {redirect_to @user, notice: "You have successfully update your user profile 🤗"}
      else
        format.html { render :edit}
      end
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
