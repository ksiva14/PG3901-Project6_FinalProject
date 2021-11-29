class Team < ApplicationRecord
  belongs_to :course, optional: true

  has_many :evaluations
  has_many :projects, through: :course
  has_many :students
end
