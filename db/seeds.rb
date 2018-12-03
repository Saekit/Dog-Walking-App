# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
Owner.destroy_all
Dog.destroy_all
Appointment.destroy_all
Walker.destroy_all
Price.destroy_all


22.times do
  User.create!(name: Faker::Name.unique.name, username:Faker::Internet.unique.username, email: Faker::Internet.email, password_digest: Faker::Internet.password)
end

@user_ids = User.pluck(:id)


# We have to iterate through to add user_ids to each owner & walker
10.times do
  Owner.create!(address: Faker::Address.street_address, city: Faker::Address.city, user_id: )
end



20.times do
  Dog.create!(name: Faker::Dog.name, age: Random.rand(1..15), breed: Faker::Dog.breed, size: Faker::Dog.size, restriction: array.sample, friendliness: emoji., image_url: default, owner_id: ??)
end

@dog_ids = Dog.pluck(:id)

10.times do
  Walker.create!(age: Random.rand(18..40), experience: array.sample, owned_dogs: false, rating: array.sample, user_ids: "???")
end

@walker_ids = Walker.pluck(:id)


35.times do
  Appointment.create!(dog_id: @dog_ids.sample, walker_id: @walker_ids.sample, datetime: Faker::Date.between(2.months.ago, 1.year.from_now), walked: false, walk_rating: 0, comment: array.sample )
end

  Price.create!(price: 5, duration: 15, appointment_id:)
