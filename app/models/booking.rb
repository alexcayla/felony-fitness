class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :scheduled_activity
end
