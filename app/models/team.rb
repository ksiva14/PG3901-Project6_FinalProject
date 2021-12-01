class Team < ApplicationRecord
  belongs_to :course, optional: true

  has_many :evaluations, dependent: :delete_all
  has_many :projects, through: :course
  has_many :students, dependent: :delete_all
end
