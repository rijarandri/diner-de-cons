class ConsController < ApplicationController

  def index
      @cons = Con.all
  end

  def show
    @con = Con.find(params[:id])
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
