class ScheduledActivity < ApplicationRecord
 geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  belongs_to :activity_type
  # has :name, through: :activity_type

  validates :location, presence: true
  validates :capacity, presence: true
  validates :date, presence: true
  validates :activity_type_id, presence:true
end
