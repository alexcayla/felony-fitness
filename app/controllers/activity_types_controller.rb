class ActivityTypesController < ApplicationController
  def index
    @activity_types = ActivityType.all
  end

  def show
    @activity_type = ActivityType.find(params[:id])
    @scheduled_activities = ScheduledActivity.where(activity_type_id: params[:id])
  end
end
