class DogsController < ApplicationController
  before_action :find_dog, only: [:show, :edit, :update, :destroy]


  def index
    @dogs = Dog.all
  end

  def show
    @owner_name = User.find(@dog.owner.user_id).name
  end

  def new
    @dog = Dog.new
    @owner = User.find(session[:user_id]).owner.id
  end

  def create
    @owner = User.find(session[:user_id]).owner.id
    @dog = Dog.create(dog_params)
    redirect_to current_owner
  end

  def edit
  end

  def update
    @dog.update(dog_params)
    redirect_to current_user
  end

  def destroy
    @dog.destroy
    redirect_to current_user
  end

  private

  def find_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :size, :restriction, :friendliness, :image_url, :owner_id)
  end
end
