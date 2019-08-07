class ActivityType < ApplicationRecord
  has_many :scheduled_activities
  has_many :bookings, through: :scheduled_activities, source: :bookings
  has_many :reviews, through: :bookings, source: :reviews

  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :price, presence: true
  validates :restrictions, presence: true
  validates :kind, presence: true
  validates :sport, presence: true

  def find_reviews
    self.bookings.collect(&:review)
  end
end
