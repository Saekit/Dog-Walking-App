require  'byebug'
class OwnersController < ApplicationController
  before_action :find_owner, only:[:show, :edit, :update, :destroy]

  def index
    @owners = Owner.includes(:user)
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.create(owner_params)

      respond_to do |format|
        if @owner.valid?
          @owner.save!
          format.html {redirect_to @owner, notice: "You have successfully created an Owner Profile😇"}
        else
          format.html {render :new}
        end
      end
  end

  def show
    @name = User.find(@owner.id).name
  end

  def edit
  end

  def update
    @owner.update(owner_params)

    respond_to do |format|
      if @owner.valid?
        @owner.save!
        format.html { redirect_to @owner, notice: "you have successfully updated your form."}
      else
        format.html render :edit
      end
    end
  end

  def destroy
    @owner.destroy

    respond_to do |format|
      format.html redirect_to @owners_path
    end
  end




  private

  def find_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:address, :city, :user_id)
  end



end
