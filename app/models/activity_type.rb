class ActivityType < ApplicationRecord
  has_many :scheduled_activities
  has_many :bookings, through: :scheduled_activities
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :price, presence: true
  validates :restrictions, presence: true
  validates :kind, presence: true
  validates :sport, presence: true
end
