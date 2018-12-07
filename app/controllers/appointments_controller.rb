require 'byebug'

class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show

  end

  def new
    @appointment = Appointment.new
    @dogs = Dog.all
    @walkers = Walker.all
    # byebug
    # @services = Service.all
  end

  def create

    @appointment = Appointment.create(
      start_time: appointment_params["start_time(5i)"],
      end_time: appointment_params["end_time(5i)"],
      dog_id: appointment_params["dog_id"],
      date: appointment_params["date"]
      )

      @start = appointment_params["start_time(5i)"]
      @end = appointment_params["end_time(5i)"]

      if @begin = DateTime.parse(@start)
          @secs = (@begin.hour * 3600) + (@begin.min * 60)
        end

      if @gone = DateTime.parse(@end)
            @sec = (@gone.hour * 3600) + (@gone.min * 60)
          end


      @service_total = ((@sec - @secs)/60 * 5)/15

    respond_to do |format|
      if @appointment.valid?
        @appointment.save!


        ServiceAppointment.create!(service_total: 16, appointment_id: @appointment.id, service_id: params[:appointment][:services].to_i, walker_id: 78)
        format.html { redirect_to @appointment, notice: "Appointment has been created successfully!!"}


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
    params.require(:appointment).permit(:dog_id, :date, :start_time, :end_time)
  end
end
