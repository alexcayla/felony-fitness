class InstructorsController < ApplicationController

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.user = current_user
    if @instructor.save!
      redirect_to dashboard_path
    else
      render 'new'
    end

  end

  private
  def instructor_params
    params.require(:instructor).permit(:instructor_photo, :bio, :qualification, :rapsheet)
  end
end
