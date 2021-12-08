# frozen_string_literal: true

class ProjectTeam < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :team, optional: true

  validates :project_id, presence: true
  validates :team_id, presence: true
end
