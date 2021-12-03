class Project < ApplicationRecord
  belongs_to :course, optional: true

  has_many :teams, through: :course
  has_many :project_teams
end
