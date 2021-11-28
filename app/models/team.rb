class Team < ApplicationRecord
  belongs_to :course, optional: true

  has_many :evaluations
  has_many :projects
  has_many :students
end
