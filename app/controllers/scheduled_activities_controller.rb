class ScheduledActivitiesController < ApplicationController
  def index
    @scheduled_activities = ScheduledActivity.geocoded
    @markers = @scheduled_activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { activity: activity })
      }
    end
  end

  def show
    @activity_type = ActivityType.find(params[:id])

    @scheduled_activity = ScheduledActivity.find(params[:id])
    @scheduled_activities = ScheduledActivity.where(activity_type_id: params[:activity_type])
    @markers = {
        lat: @scheduled_activity.latitude,
        lng: @scheduled_activity.longitude,
        infoWindow: render_to_string(partial: "info_window_2", locals: { scheduled_activity: @scheduled_activity })
      }
  end

  def new
    @scheduled_activity = ScheduledActivity.new
    @activity_types = ActivityType.all
  end

  def create
    @scheduled_activity = ScheduledActivity.new(activity_params)
    @activity_type = ActivityType.find(params[:scheduled_activity][:activity_type_id])
    @scheduled_activity.user = current_user
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
