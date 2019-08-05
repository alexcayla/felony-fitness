class ScheduledActivity < ApplicationRecord
  belongs_to :instructor
  belongs_to :activity_type
end
