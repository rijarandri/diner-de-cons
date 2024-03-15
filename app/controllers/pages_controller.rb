class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
  end

  def profile
    #
    @bookings = Booking.all
    @pictures = ["ektqxe6k0fqts6gg1mmq", "rnlcc7qpih5ow7vmxklh", "dd5tz4n4cakrgs2weqdz", "pchrfs4qq7onj2uhocif", "z9v0ynqutvlkwqecmtpu", "cfpbeyje1oaoxx8mejpf", "mtusoueesd2xry2hzwbn", "la6vyrinnxtvax9ozlvh", "yszodyrsybaili1ybdgy", "usyj8ekrkmneangld3xj", "p13ooyt7cuanpygmhfne", "yc6ds5yt9uwjojkuhkt0", "jng6chw4rfn9ms7dbkyb", "kxdzcgddb6jihcovkpn1", "fvwecmgjigrjtayi7v18", "xwnho5f2brqi9rdpobci", "mh3nos7ix08gfgprinfl", "mh3nos7ix08gfgprinfl"]
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
