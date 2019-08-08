class ScheduledActivity < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  belongs_to :activity_type

  has_many :bookings
  has_many :reviews, through: :bookings, source: :reviews

  validates :location, presence: true
  validates :capacity, presence: true
  validates :date, presence: true
  validates :activity_type_id, presence:true

  def name
    self.activity_type.name
  end
end
