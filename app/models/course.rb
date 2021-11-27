class Course < ApplicationRecord
  has_many :teams
  has_many :professors
  has_many :projects
end
