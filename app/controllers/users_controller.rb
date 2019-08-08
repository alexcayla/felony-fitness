# require 'faker'

class UsersController < ApplicationController
  def show
    @my_bookings =  Booking.where(user_id: current_user.id)
  end

  def index
    @users = User.all
  end

end
