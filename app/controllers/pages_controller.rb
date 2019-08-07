class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @scheduled_activities = ScheduledActivity.all
  end
end
