# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 30 users - 29 students, 1 professor
30.times do |i|
  User.create! name: Faker::Name.unique.name, email: "name.#{i}@osu.edu",
               password: Faker::Alphanumeric.alphanumeric(number: 15)
end
User.create! name: "Karthick", email: "siva.8@osu.edu", password: "baseball"
Student.create! user_id: 31, team_id: 2
# 29 students - split into 2 teams
15.times do
  Student.create! user_id: Faker::Number.unique.between(from: 1, to: 15),
                  team_id: Faker::Number.between(from: 1, to: 2)
end
# 1 professor
Professor.create! user_id: 30, course_id: 1

# 3 courses
num = 3901
3.times do
  Course.create! course_name: "CSE #{num}", course_num: num, dept_name: 'Computer Science & Engineering'
  num += 1
end

# 2 team, 2 project for 3901
2.times do |i|
  Team.create! team_name: Faker::Game.unique.title, course_id: 1
  Project.create! project_name: "Project #{i + 1}", course_id: 1
end

# 2 team for 3902
2.times do
  Team.create! team_name: Faker::Game.unique.title, course_id: 2
end
