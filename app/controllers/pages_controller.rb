class PagesController < ApplicationController
  def home
  end

  def profile
    #
    @user = current_user
    @cons = @user.cons
  end
end

# has_many :cons
# current_user.cons = []
 # -> itération
# has_many :bookings
# current_user.bookings => []
 # -> itération
