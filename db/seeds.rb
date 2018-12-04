# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


User.destroy_all
Owner.destroy_all
Dog.destroy_all
Appointment.destroy_all
Walker.destroy_all
Service.destroy_all


22.times do
  User.create!(name: Faker::Name.unique.name, username:Faker::Internet.unique.username, email: Faker::Internet.email)
end

@user_ids = User.pluck(:id)


# We have to iterate through to add user_ids to each owner & walker
10.times do |i|
  Owner.create!(address: Faker::Address.street_address, city: Faker::Address.city, user_id: @user_id[i])
end

# @friendliness = [😢, 😤, 🤐, 🤡, 🤔, 😃, 😇]
@friendly = ["aggressive", "untrained", "playful" , "passive", "friendly", "trained"]

20.times do
  Dog.create!(name: Faker::Dog.name, age: Random.rand(1..15), breed: Faker::Dog.breed, size: Faker::Dog.size, restriction: array.sample, friendliness: @friendly.sample, image_url: default, owner_id: @owner_ids.sample)
end

@dog_ids = Dog.pluck(:id)
@experience = ["in-training", "apprentice", "certified"]
@rating = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

10.times do
  Walker.create!(age: Random.rand(18..40), experience: @experience.sample, owned_dogs: false, rating: @rating.sample, user_ids: @user_id[i+10])
end

@walker_ids = Walker.pluck(:id)
@comments = ["Great Walk, would definitly use this walker again", "Walker was late and left my door unlocked", "Okay", "Excellent", "Satisfactory", "Horrible, walker should be fired"]


35.times do
  Appointment.create!(dog_id: @dog_ids.sample, walker_id: @walker_ids.sample, datetime: Faker::Date.between(6.months.ago, 1.year.from_now), walked: false, walk_rating: @rating.sample, comment: @comments.sample )
end

20.times do |i|
  Service.create!(name: "Dog Walking", price_per_15min: 5, duration: 15, appointment_id: @appointment_ids[i])
end
5.times do |i|
  Service.create!(name: "Home Services", price_per_30min: 7, duration: 15, appointment_id: @appointment_ids[i+20])
end

5.times do |i|
  Service.create!(name: "In-home Pet Sitting", price_per_60min: 10, duration: 15, appointment_id: @appointment_ids[i+25])
end

5.times do |i|
  Service.create!(name: "Overnight Services", price_per_60min: 12, duration: 15, appointment_id: @appointment_ids[i+30])
end
