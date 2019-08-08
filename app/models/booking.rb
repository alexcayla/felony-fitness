class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :scheduled_activity
  has_many :reviews

  def date
    self.scheduled_activity.date
  end
end
