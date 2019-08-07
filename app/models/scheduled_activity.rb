class ScheduledActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity_type
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :location, presence: true
  validates :capacity, presence: true
  validates :date, presence: true
  validates :activity_type_id, presence: true


  def instructor
    self.user.instructor
  end

  def name
    self.activity_type.name
  end
end
