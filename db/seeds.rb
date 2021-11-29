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
# 29 students - split into 2 teams
3.times do
  Student.create! user_id: Faker::Number.unique.between(from: 1, to: 29),
                  course_id: 1, team_id: 1
end
3.times do
  Student.create! user_id: Faker::Number.unique.between(from: 1, to: 29),
                  course_id: 1, team_id: 2
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
2.times do
  Team.create! team_name: Faker::Game.unique.title, course_id: 1
end
Project.create! project_name: 'Project 1', course_id: 1, team_id: 1
Project.create! project_name: 'Project 1', course_id: 1, team_id: 2
Project.create! project_name: 'Project 2', course_id: 1, team_id: 1
Project.create! project_name: 'Project 2', course_id: 1, team_id: 2
# create evaluation for each student in team 1

Evaluation.create! team_id: 1, for_student: 1, by_student: 2, score: 555, comment: 'Comment', project_id: 1
Evaluation.create! team_id: 1, for_student: 1, by_student: 3, score: 555, comment: 'Comment', project_id: 1
Evaluation.create! team_id: 1, for_student: 2, by_student: 1, score: 555, comment: 'Comment', project_id: 1
Evaluation.create! team_id: 1, for_student: 2, by_student: 3, score: 555, comment: 'Comment', project_id: 1
Evaluation.create! team_id: 1, for_student: 3, by_student: 1, score: 555, comment: 'Comment', project_id: 1
Evaluation.create! team_id: 1, for_student: 3, by_student: 2, score: 555, comment: 'Comment', project_id: 1

Evaluation.create! team_id: 2, for_student: 4, by_student: 5, score: 555, comment: 'Comment', project_id: 1
Evaluation.create! team_id: 2, for_student: 4, by_student: 6, score: 555, comment: 'Comment', project_id: 1
Evaluation.create! team_id: 2, for_student: 5, by_student: 4, score: 555, comment: 'Comment', project_id: 1
Evaluation.create! team_id: 2, for_student: 5, by_student: 6, score: 555, comment: 'Comment', project_id: 1
Evaluation.create! team_id: 2, for_student: 6, by_student: 4, score: 555, comment: 'Comment', project_id: 1
Evaluation.create! team_id: 2, for_student: 6, by_student: 5, score: 555, comment: 'Comment', project_id: 1

# 2 team for 3902
2.times do
  Team.create! team_name: Faker::Game.unique.title, course_id: 2
end
