class ScheduledActivitiesController < ApplicationController
  def index
      @scheduled_activities = ScheduledActivity.all
  end

  def show
    @activity_type = ActivityType.find(params[:activity_type_id])
    @scheduled_activities = ScheduledActivity.where(activity_type_id: params[:activity_type])
  end

  def new
    @Scheduled_activity = ScheduledActivity.new
  end

  def create
    @Scheduled_activity = ScheduledActivity.new
    @activity_type = ActivityType.find(params[:activity_type][:id])
    @scheduled_activity.save!
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
end
