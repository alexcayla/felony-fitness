 class Instructor < ApplicationRecord
  belongs_to :user
  has_many :scheduled_activities
end
