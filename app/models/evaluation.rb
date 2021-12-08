class Evaluation < ApplicationRecord
  belongs_to :team, optional: true

  validates :project_id, presence: true
  validates :team_id, presence: true
  validates :for_student, presence: true

  #Association Validations
  #validates_associated :team
end
