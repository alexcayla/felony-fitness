class InstructorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
    @scheduled_activities = ScheduledActivity.where(instructor_id: params[:id])
    @unique_activity_types = @instructor.activity_types.uniq
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    user = current_user
    if @instructor.save
      redirect_to dashboard_path # or, redirect_to @instructor
    else
      render :new
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update(instructor_params)
      redirect_to @instructor
    else
      render 'edit'
    end
  end

  def delete
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    redirect_to instructors
  end

  private

  def instructor_params
    params.require(:instructor).permit(:instructor_photo, :bio, :qualification, :rapsheet)
  end
end
#   private

#   def instructor_params
#     params.require(:user_id).permit(:instructor_photo, :bio, :qualification, :rapsheet)
#   end
# end
