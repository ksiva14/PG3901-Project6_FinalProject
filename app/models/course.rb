class Course < ApplicationRecord
  has_many :students
  has_many :professors
  has_many :teams
  has_many :projects
end
