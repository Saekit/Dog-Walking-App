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

    respond_to do |format|
      if @service_appointment.valid?
        @service_appointment.save!
        format.html {redirect_to service_appointments, notice: "You have successfully created a service appointment"}
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
    @service_appointment.update(service_appointment_params)

    respond_to do |format|
      if @service_appointment.valid?
        @service_appointment.save!
        format.html {redirect_to @service_appointment, notice: "You have successfully updated your form."}
      else
        format.html { render :new}
      end
    end
  end

  def destroy
    @service_appointment.destroy

    respond_to do |format|
      if @service_appointment.valid?
        @service_appointment.save
        format.html {redirect_to service_appointments_path, notice: "You have successfully deleted the service appointment."}
      else
        format.html {render :edit}
      end
    end
  end

  private

  def find_service_appointment
    @service_appointment =  ServiceAppointment.find(params[:id])
  end

  def service_appointment_params
    params.require(:service_appointment).permit(:service_total, :appointment_id, :service_id)
  end







end
