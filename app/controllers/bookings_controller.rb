class BookingsController < ApplicationController

  def index
    @my_bookings = Booking.where(user_id: current_user)
  end

  def create
    my_booking = Booking.new(user_id: current_user.id, scheduled_activity_id: params[:class_id])
    if my_booking.save!
      redirect_to user_path(current_user)
    else
      raise
      redirect_back
    end
  end

  def edit

  end

  def new
    create
  end

  def destroy
    my_booking = Booking.find(params[:id])
    redirect_to user_path
  end
end
