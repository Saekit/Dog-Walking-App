class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
    @walker_name = User.find(@appointment.walker.user_id).name
  end

  def new
    @appointment = Appointment.new
    @dogs = Dog.all
    @walkers = Walker.all
    # byebug
    # @services = Service.all
  end

  def create
    @appointment = Appointment.create(appointment_params)

    respond_to do |format|
      if @appointment.valid?
        @appointment.save!
        format.html { redirect_to appointment, notice: "Appointment has been created successfully!!"}
      else
        @dogs = Dog.all
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    @appointment.update(appointment_params)
    redirect_to @appointment
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private
  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:dog_id, :walker_id, :date, :time, :comment)
  end
end
