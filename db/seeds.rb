# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'byebug'

User.destroy_all
Owner.destroy_all
Dog.destroy_all
Appointment.destroy_all
Walker.destroy_all
Service.destroy_all




10.times do
  User.create!(username: Faker::Internet.unique.username, password: Faker::Internet.password, email: Faker::Internet.email, role: "owner")
end

12.times do
  User.create!(username: Faker::Internet.unique.username, password: Faker::Internet.password, email: Faker::Internet.email, role: "walker" )
end

@user_ids = User.pluck(:id)


# We have to iterate through to add user_ids to each owner & walker
10.times do |i|
  Owner.create!(name: Faker::Name.unique.name, address: Faker::Address.street_address, city: Faker::Address.city, user_id: @user_ids[i])
end

@owner_ids = Owner.pluck(:id)

# @friendliness = [😢, 😤, 🤐, 🤡, 🤔, 😃, 😇]
@friendly = ["aggressive", "untrained", "playful" , "passive", "friendly", "trained"]
@restrictions = ["medication", "no human food", "on diet", "stay away from other dogs"]

20.times do
  Dog.create!(name: Faker::Dog.name, age: Random.rand(1..15), breed: Faker::Dog.breed, size: Faker::Dog.size, restriction: @restrictions.sample, friendliness: @friendly.sample, owner_id: @owner_ids.sample)
end
dog_pics = ["corgi.jpg", "eskimo.jpg", "husky.jpg", "lab.jpg"]
4.times do
  Dog.create!(name: Faker::Dog.name, age: Random.rand(1..15), breed: Faker::Dog.breed, size: Faker::Dog.size, restriction: @restrictions.sample, friendliness: @friendly.sample, owner_id: @owner_ids.sample, image_url: dog_pics.shuffle.sample)
end

@dog_ids = Dog.pluck(:id)
@experience = ["in-training", "apprentice", "certified"]
@rating = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  # Walker.create!(age: 0, experience: "placeholder", rating: 0, user_id: @user_ids.sample)

10.times do |i|
  Walker.create!(age: Random.rand(18..40), experience: @experience.sample, rating: @rating.sample, user_id: @user_ids[i+10])
end

@walker_ids = Walker.pluck(:id)
@comments = ["Great Walk, would definitly use this walker again", "Walker was late and left my door unlocked", "Okay", "Excellent", "Satisfactory", "Horrible, walker should be fired"]


@times = ["6:00", "7:00", "8:00", "9:00", "10:00", "11:00","6:15", "7:15", "8:15", "9:15", "10:15", "11:15" ]
@time = ["6:30", "7:45", "8:15", "9:15", "10:30", "11:15","6:45", "7:30", "8:45", "9:30", "10:45", "11:30" ]
35.times do
  Appointment.create!(dog_id: @dog_ids.sample, date: Faker::Date.between(6.months.ago, 1.year.from_now),start_time: @times.sample , end_time:@time.sample)
end

#price per 15 mins
  Service.create!(name: "Dog Walking", price: 5, duration: 15)
#price per 30 mins
  Service.create!(name: "Home Services", price: 7, duration: 15)
#price per 60 mins
  Service.create!(name: "In-home Pet Sitting", price: 10, duration: 15)
#price per 60 mins
  Service.create!(name: "Overnight Services", price: 12, duration: 15)

@service = Service.pluck(:id)
@total = [5, 10, 15, 20, 14, 21, 30, 36, 12]
@appointments = Appointment.pluck(:id)
@notes = ["dog was great, well trained", "dog is aggressive towards other dogs", "dog does not like to walk a lot", "This is a superfun dog!!", "Awesome walk"]

35.times do
  ServiceAppointment.create!(service_total: @total.sample, appointment_id: @appointments.sample, service_id: @service.sample, walked: true, walk_rating: @rating.sample, walker_notes: @notes.sample, owner_comments: @comments.sample, walker_id: @walker_ids.sample )
end


puts "done"
