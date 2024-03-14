class ConsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @cons = Con.all
    @categories = ["con de droite", "chroniqueur france inter", "mysogine", "beauf", "supporter de foot", "zadiste", "influenceur", "avocat fiscaliste", "conspirationniste", "Pascal Praud"]
    if params[:category].present?
      @cons = Con.where(category: params[:category])
    else
      @cons = Con.all
    end
  end

  def show
    @con = Con.find(params[:id])
    @booking = Booking.new
    @booking_dates = @con.bookings.map {|b| b.date}
  end

  def new
    @con = Con.new
  end

  def create
    @con = Con.new(con_params)
    @con.user = current_user
    if @con.save!
      redirect_to con_path(@con)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def con_params
    params.require(:con).permit(:name, :category, :price, :description, photos: [])
  end
end
