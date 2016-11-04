# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  user = User.new
  user.email = Faker::Internet.email
  user.name = Faker::Name.name
  user.password = Faker::Internet.password
  user.password_confirmation = user.password
  user.save!
  10.times do
    shout = Shout.new
    shout.body = Faker::Lorem.sentence
    shout.user = User.all.sample
    shout.save!
  end
end
