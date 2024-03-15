class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :refuse]
  before_action :set_con, only: %i[create]

  def accept
    @booking.update(accepted: true) if current_user.id == @booking.con.user_id
    redirect_to profile_path
  end

  def refuse
    @booking.update(accepted: false)
    redirect_to profile_path
  end

  # def new
  #   @booking = Booking.new
  #   @booking_dates = @con.bookings.map {|b| b.date}
  # end

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
