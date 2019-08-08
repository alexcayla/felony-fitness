 class Instructor < ApplicationRecord
  belongs_to :user
  has_many :scheduled_activities

  def name
    self.user.name
  end
end
