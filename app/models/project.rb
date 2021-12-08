# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :course, optional: true

  has_many :teams, through: :course
  has_many :project_teams, dependent: :delete_all

  validates :project_name, presence: true
  validates :course_id, presence: true
end
