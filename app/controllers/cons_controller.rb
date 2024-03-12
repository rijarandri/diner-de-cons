class ConsController < ApplicationController

  def index
      @cons = Con.all
  end

  def show
    @con = Con.find(params[:id])
  end

def new
end

def create
end

end
