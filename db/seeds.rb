# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  user = User.create! name: Faker::Name.unique.name, email: "student.#{i + 1}@osu.edu",
                      password: "student.#{i + 1}@osu.edu"
  Student.create! user_id: user.id
end

2.times do |i|
  user = User.create! name: "Prof. #{Faker::Name.unique.name}", email: "professor.#{i + 1}@osu.edu",
                      password: "professor.#{i + 1}@osu.edu"
  Professor.create! user_id: user.id
end

num = 3901
2.times do |i|
  user = User.find_by(email: 'professor.1@osu.edu')
  Course.create! course_name: "CSE #{num}", course_num: num
  Professor.create! user_id: user.id, course_id: i + 1
  num += 1
end

# 1 team for 3901
Team.create! team_name: Faker::Game.unique.title, course_id: 1

# # 29 students
# 29.times do
#   Student.create! user_id: Faker::Number.unique.between(from: 1, to: 29),
#                   team_id: Faker::Number.between(from: 1, to: 5)
# end

# # 1 professor
# Professor.create! user_id: 30, course_id: 1

# # ------------------------------ For Testing out project page ---------------------------------------------
# 3.times do
#   Student.create! user_id: Faker::Number.unique.between(from: 1, to: 29),
#                   course_id: 1, team_id: 1
# end
# 3.times do
#   Student.create! user_id: Faker::Number.unique.between(from: 1, to: 29),
#                   course_id: 1, team_id: 2
# end

# Team.create! team_name: Faker::Game.unique.title, course_id: 1
# Team.create! team_name: Faker::Game.unique.title, course_id: 1

# Project.create! project_name: 'Project 1', course_id: 1
# Project.create! project_name: 'Project 2', course_id: 1
