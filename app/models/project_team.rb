class ProjectTeam < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :team, optional: true
end
