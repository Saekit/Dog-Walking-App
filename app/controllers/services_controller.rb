class ServicesController < ApplicationController

  before_action :find_service, only:[:show, :edit, :update, :destroy]


  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.create(service_params)
    respond_to do |format|
        if @service.valid?
            @service.save!
          format.html {redirect_to @service, notice: "Your have successfully created a new service"}
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
    @service.update(service_params)
    respond_to do |format|
        if @service.valid?
            @service.save!
          format.html {redirect_to @service, notice: "Your have successfully created a new service"}
        else
          format.html {render :edit}
        end
      end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html {redirect_to services_path}
    end
  end


  private

  def find_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :price, :duration)
  end
end
