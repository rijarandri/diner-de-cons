class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
  end

  def profile
    #
    @bookings = Booking.all
    @user = current_user
    @cons = @user.cons
    @user_bookings = @user.bookings.to_a.sort_by! { |booking| booking.date}.reverse!
  end
end

# has_many :cons
# current_user.cons = []
 # -> itération
# has_many :bookings
# current_user.bookings => []
 # -> itération
