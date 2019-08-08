class ActivityTypesController < ApplicationController
  def index
    @activity_types = ActivityType.all
    # @markers = @activity_types.map do |activity|
    #   {
    #     lat: activity.latitude,
    #     lng: activity.longitude,
    #     infoWindow: render_to_string(partial: "info_window", locals: { activity: activity })
    #   }
    # end
  end

  def show
    @activity_type = ActivityType.find(params[:id])
    @scheduled_activities = ScheduledActivity.where(activity_type_id: params[:id])
    @markers =  [{lat: -8.6908357, lng: 115.2312006}]


    if  @activity_type.scheduled_activities.any?
    @markers = @activity_type.scheduled_activities.map do |activity|

        if activity.latitude.nil?
          {lat: "-8.6908357",
          lng: "115.2312006",
          infoWindow: render_to_string(partial: "info_window_3", locals: { activity_type: @activity_type })}
        else
          {lat: activity.latitude,
          lng: activity.longitude,
          infoWindow: render_to_string(partial: "info_window_3", locals: { activity_type: @activity_type })}
        end
        # lat: @activity_type.scheduled_activities.collect(&:latitude),
        # lng: @activity_type.scheduled_activities.collect(&:longitude),

    end
  end
  end

  def new
    @activity_type = ActivityType.new
  end

  def create
    @activity_type = ActivityType.new(activity_type_params)
    if @activity_type.save
      redirect_to @activity_type
    else
      render :new
    end
  end

  def edit
    @activity_type = ActivityType.find(params[:id])
  end

  def update
    @activity_type = ActivityType.find(params[:id])
    if @activity_type.update(activity_type_params)
      redirect_to @activity_type
    else
      render 'edit'
    end
  end

  def delete
    @activity_type = ActivityType.find(params[:id])
    @activity_type.destroy
    redirect_to activity_types
  end

  private

  def activity_type_params
    params.require(:activity_type).permit(:name, :description, :duration, :price, :restrictions, :sport, :kind)
  end
end
