class ActivityType < ApplicationRecord
  has_many :scheduled_activities
  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :price, presence: true
  validates :restrictions, presence: true
  validates :type, presence: true
  validates :sport, presence: true
end
