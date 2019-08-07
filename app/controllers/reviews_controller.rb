class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:format])
  end

  def create
    @review = Review.new(review_params)
    booking = Booking.find(params[:format])
    @review.booking = booking
    @review.user = current_user
    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review)
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
