class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :instructor
  has_many :bookings
  has_many :reviews

  def instructor_profile
    Instructor.find(user_id: self.id)
  end
end
