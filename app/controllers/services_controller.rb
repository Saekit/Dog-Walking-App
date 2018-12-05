class ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :create, :destroy]


  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.create(service_params)
    redirect_to @service
  end

  def edit
  end

  def update
    @service.update(service_params)
    redirect_to @service
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end


  private
  def service_params
    params.require(:service).permit(:name, :price, :duration)
  end

  def find_service
    @service = Service.find(params[:id])
  end
end
