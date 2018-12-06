class WalkersController < ApplicationController

before_action :find_walker, only:[:show, :edit, :update, :destroy]

  def index
    @walkers = Walker.all
  end

  def new
    @walker = Walker.new
  end

  def create
    @walker = Walker.create(walker_params)
    if @walker.save
      redirect_to @walker
    else
      flash[:errors] = @walker.errors.full_messages
      redirect_to new_walker_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @walker.update(walker_params)
    if @walker.save
      redirect_to @walker
    else
      flash[:errors] = @walker.errors.full_messages
      redirect_to new_walker_path
    end
  end

  def destroy
    @walker.destroy
    redirect_to walkers_path
  end

  private

  def find_walker
    @walker = Walker.find(params[:id])
  end

  def walker_params
    params.require(:walker).permit(:age, :experience, :own_dogs, :ratings, :user_id )
  end


end
