require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# puts 'Creating 100 fake felons...'
#   instructor = Instructor.new(
#     # name:    Faker::Company.name,
#     # address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#     # rating:  rand(0..5)

#     instructor_photo: string
#     bio: text
#     qualification: text
#     rapsheet: text
#   )
#   restaurant.save!
# end
# puts 'Finished!'
# felons = Instructor.create()


# Shared values
email_providers = ['gmail.com', 'yahoo.com', 'darknet.org', 'drugs4you.net', 'hotmail.com', 'icloud.com']
users = []
activity_types = []
scheduled_activities = []
kind = ['indoor', 'open gym', 'beach', 'in your own home']
activity_names = ["Thierry's Tunneling Class", "Baby Face's Downward Facing Dog n' Chill", "Boris' Gun Show", "Thierry's Farmhouse Endurance Raid", "Baby Face's Stealthy Circuit", "Thierry's Vinyassa Victims", "Boris' Guide to Internet Stalking"]
instructors = ["Murph 'the surf' Maloney", "Son of Samantha", "Lucy Lightfinger", "Betty Batu", "Bugsy Balong", "Butcher of Berawa", "Lettuce B Freeman", "Tony The Tourist Tickler"]
final_instructor = []
location = ["Denpasar, Bali, Indonesia", "Canggu, Bali, Indonesia", "Seminyak, Bali, Indonesia", "Uluwatu, Bali, Indonesia", "Kuta, Bali, Indonesia"]

10.times do
  puts "Creating 10 fake users"
  name = Faker::FunnyName.unique.two_word_name
  first_name = name.split(' ')[0]
  last_name = name.split(' ')[1]
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@#{email_providers.sample}",
    password: '1234567',
    photo: ''
    )
  users << user
  user.save!
end

activity_names.each do
  puts "Creating #{activity_names.count} fake activity types"

  activity = ActivityType.new(
      name: activity_names.sample,
      description: "With felony fitness classes, you never know what's coming!",
      duration: [30, 45, 60, 75, 90].sample,
      price: rand(15..60),
      restrictions: ['none', 'no wimps allowed', 'bring your own tools'].sample,
      sport: ['CrossFit', 'Yoga', 'Bodybuilding', 'Running', 'Endurance Training'].sample,
      kind: kind.sample
    )

  activity_types << activity
  activity.save!
end

i = 0
while i < instructors.count
  puts "Creating instructors"
  instructor = Instructor.new(
    instructor_photo: '',
    bio: 'I had a tough life',
    qualification: 'Trust me, I have enough experience',
    rapsheet: 'Grand theft auto, battery, larceny',
    user: users[i]
    )
  final_instructor << instructor
  i += 1
  instructor.save!
end

20.times do
  puts "Creating fake scheduled_activities"
  act_type = activity_types.sample
  sched = ScheduledActivity.new(
    date: Date.new,
    user: users.sample,
    activity_type: activity_types.sample,
    location: location.sample,
    capacity: rand(1..45),
    instructor_id: final_instructor.sample.id
    )
  scheduled_activities << sched
  sched.errors.full_messages
  sched.save!
end

50.times do
  puts "Creating 50 bookings"
  booking = Booking.new(
    user: users.sample,
    scheduled_activity: scheduled_activities.sample
    )
  booking.save!
end
