class Team < ApplicationRecord
  belongs_to :course, optional: true

  has_many :evaluations, dependent: :delete_all
  has_many :projects, through: :course
  has_many :project_teams, dependent: :delete_all
  has_many :students, dependent: :delete_all

  validates :team_name, presence: true, uniqueness: true
end
