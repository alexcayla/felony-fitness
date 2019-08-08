class BookingsController < ApplicationController

  def index
    @my_bookings = Booking.where(user_id: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    my_booking = Booking.new(user_id: current_user.id, scheduled_activity_id: params[:scheduled_activity_id])
    if my_booking.save!
      redirect_to dashboard_path
    else
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
    my_booking.destroy
    redirect_to dashboard_path
  end
end
