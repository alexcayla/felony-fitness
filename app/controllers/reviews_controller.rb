class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.user = current_user
    if @review.save
      redirect_to @booking
    else
      # byebug
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to @review
  end

  def delete
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
