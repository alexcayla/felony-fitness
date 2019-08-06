class ActivityTypesController < ApplicationController

  def index
    @activity_types = ['potatoes', 'tomatoes']
  end

  def show
    @activity_type = ActivityType.find(params[:id])
  end

end
