class DogsController < ApplicationController
  before_action :find_dog, only: [:show, :edit, :update, :destroy]


  def index
    @dogs = Dog.all
  end

  def show
    @owner_name = User.find(@dog.owner.user_id).name
  end

  def new
    @dog = current_user.dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    redirect_to @dog
  end

  def edit
  end

  def update
    @dog.update(dog_params)
    redirect_to @dog
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def find_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :size, :restriction, :friendliness, :image_url, :owner_id)
  end
end
