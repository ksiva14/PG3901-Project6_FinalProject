# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
  User.create! name: Faker::Name.unique.name, email: Faker::Internet.unique.email,
               password_digest: Faker::Alphanumeric.alphanumeric(number: 10)
end

num = 3901
index = 1
5.times do
  Team.create! team_name: Faker::Game.unique.title
  Course.create! course_num: num
  Project.create! project_name: `Project #{index}`
  num += 1
  index += 1
end
