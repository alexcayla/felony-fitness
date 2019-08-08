class PagesController < ApplicationController
  before_action :user_bookings
  skip_before_action :authenticate_user!, only: :home

  def home
    @scheduled_activities = ScheduledActivity.all
  end


  def dashboard
    # I think I would need to sort it by date. Doing so, if the first date is nil. That means that
    sorted_bookings = @user_bookings.sort_by &:date

    @upcoming_bookings = sorted_bookings.select do |booking|
       booking.date > Date.today
    end

    @past_bookings = sorted_bookings.select do |booking|
       booking.date < Date.today
    end

  end


  private

  def upcoming
    @upcoming_bookings = @user_bookings.collect { |booking| booking.date > Date.today}
  end

  def user_bookings
    @user_bookings =  Booking.where(user_id: current_user.id)
  end

end
