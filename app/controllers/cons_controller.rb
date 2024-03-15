class ConsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @cons = Con.all
    @pictures = ["ektqxe6k0fqts6gg1mmq", "rnlcc7qpih5ow7vmxklh", "dd5tz4n4cakrgs2weqdz", "pchrfs4qq7onj2uhocif", "z9v0ynqutvlkwqecmtpu", "cfpbeyje1oaoxx8mejpf", "mtusoueesd2xry2hzwbn", "la6vyrinnxtvax9ozlvh", "yszodyrsybaili1ybdgy", "usyj8ekrkmneangld3xj", "p13ooyt7cuanpygmhfne", "yc6ds5yt9uwjojkuhkt0", "jng6chw4rfn9ms7dbkyb", "kxdzcgddb6jihcovkpn1", "fvwecmgjigrjtayi7v18", "xwnho5f2brqi9rdpobci", "mh3nos7ix08gfgprinfl", "mh3nos7ix08gfgprinfl"]
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
    if @con.save
      redirect_to con_path(@con)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @con = Con.find(params[:id])
  end

  def update
    @con = Con.find(params[:id])
    @con.update(con_params)
    redirect_to con_path(@con)
  end

  private

  def con_params
    params.require(:con).permit(:name, :category, :price, :description, photos: [])
  end
end
