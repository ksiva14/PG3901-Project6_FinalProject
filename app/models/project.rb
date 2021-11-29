class Project < ApplicationRecord
  belongs_to :course, optional: true

  has_many :teams, through: :course
end
