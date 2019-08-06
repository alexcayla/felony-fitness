class ActivityTypesController < ApplicationController
  def index
    @activity_types = ActivityType.all
  end

  def show
    @activity_type = ActivityType.find(params[:id])
  end

  def new
    @activity_type = ActivityType.new
  end

  def create
    @activity_type = ActivityType.new(activity_type_params)
    if @activity_type.save
      # redirect_to cocktail_path(@cocktail)
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
    @activity_type.update(activity_type_params)
    redirect_to activity_type_path(@activity_type)
  end

  def delete
    @activity_type = ActivityType.find(params[:id])
    @activity_type.destroy
    redirect_to activity_types
  end

  private

  def activity_type_params
    params.require(:activity_type).permit(:name, :description, :duration, :price, :restrictions, :type, :sport)
  end
end
