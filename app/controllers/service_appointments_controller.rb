class ServiceAppointmentsController < ApplicationController

  before_action :find_service_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @service_appointments = ServiceAppointment.all
  end

  def new
    @service_appointment = ServiceAppointment.new
  end

  def create
    @service_appointment = ServiceAppointment.create(service_appointment_params)
    if @service_appointment.valid?
      redirect_to @service_appointment
    else
      flash[:errors] = @service_appointment.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @service_appointment.update(service_appointment_params)
    # byebug
    if @service_appointment.valid?
      @service_appointment.save!

      if @service_appointment.walker
        redirect_to walker_path(@service_appointment.walker.id)
      else
        redirect_to owner_path(@service_appointment.appointment.dog.owner.id)
      end

    else
      flash[:errors] = @service_appointment.errors.full_messages
      render :edit
    end

  end

  def destroy
    @service_appointment.destroy
    redirect_to service_appointments_path
  end

  private

  def find_service_appointment
    @service_appointment =  ServiceAppointment.find(params[:id])
  end

  def service_appointment_params
    params.require(:service_appointment).permit(:service_total, :appointment_id, :service_id, :walker_id)
  end







end
