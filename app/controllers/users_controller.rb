class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def new
  end
end
