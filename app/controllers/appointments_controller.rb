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
    # @walker_name = User.find(@appointment.walker.user_id).name
  end

  def create
    @appointment = Appointment.create(appointment_params)
    redirect_to @appointment
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
    params.require(:appointment).permit(:dog_id, :walker_id, :datetime, :status, :walked, :walk_rating, :comment, :user_id)
  end
end
