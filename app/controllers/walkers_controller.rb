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

    respond_to do |format|
      if @walker.valid?
        @walker.save
        format.html {redirect_to walker, notice: "You have successfully created a walker"}
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
    @walker.update(walker_params)

    respond_to do |format|
      if @walker.valid?
        @walker.save
        format.html {redirect_to walker, notice: "You have successfully updated your form!"}
      else
        format.html render :edit
      end
    end
  end

  def destroy
    @walker.destroy
  end

  private

  def find_walker
    @walker = Walker.find(params[:id])
  end

  def walker_params
    params.require(:walker).permit(:age, :experience, :own_dogs, :ratings, :user_id )
  end


end
