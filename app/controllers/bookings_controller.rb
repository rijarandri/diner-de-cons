class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :refuse]
  before_action :set_con, only: %i[new create]

  def accept
    @booking.update(accepted: true)
  end

  def refuse
    booking.update(accepted: false)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.con = @con
    @booking.user = current_user

    if @booking.save
      redirect_to con_path(@con)
    else
      render 'cons/show', status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_con
    @con = Con.find(params[:con_id])
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
