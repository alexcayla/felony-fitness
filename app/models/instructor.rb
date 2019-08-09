 class Instructor < ApplicationRecord
  mount_uploader :instructor_photo, PhotoUploader

  belongs_to :user
  has_many :scheduled_activities
  has_many :activity_types, through: :scheduled_activities

  def name
    self.user.name
  end
end
