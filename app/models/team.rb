class Team < ApplicationRecord
  has_many :students
  has_many :evaluations
  has_many :projects
  belongs_to :course, optional: true
end
