class ScheduledActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity_type
end
