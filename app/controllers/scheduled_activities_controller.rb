class ScheduledActivitiesController < ApplicationController
  def index
    @scheduled_activities = ScheduledActivity.all
  end

  def show
    # @activity_type = ActivityType.find(params[:id])
    @scheduled_activity = ScheduledActivity.find(params[:id])
    @scheduled_activities = ScheduledActivity.where(activity_type_id: params[:activity_type])
  end

  def new
    @scheduled_activity = ScheduledActivity.new
    @activity_types = ActivityType.all
  end

  def create
    @scheduled_activity = ScheduledActivity.new(activity_params)
    # @scheduled_activity.user = User.find(1)
    @activity_type = ActivityType.find(params[:scheduled_activity][:activity_type_id])
    if @scheduled_activity.save
      redirect_to scheduled_activities_path
    else
      render "new"
    end
  end

  def edit
    @activity_types = ActivityType.all
    @scheduled_activity = ScheduledActivity.find(params[:id])
  end

  def update
    @scheduled_activity = ScheduledActivity.find(params[:id])
    @scheduled_activity.update(activity_params)
    redirect_to scheduled_activity_path(@scheduled_activity)
  end

  def destroy
     @scheduled_activity = ScheduledActivity.find(params[:id])
     @scheduled_activity.destroy
     redirect_to scheduled_activities_path
  end

  private

  def activity_params
    params.require(:scheduled_activity).permit(:activity_type_id, :date, :location, :capacity)
  end
end
