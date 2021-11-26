class Evaluation < ApplicationRecord
  belongs_to :project
  belongs_to :team
  belongs_to :student

  # validates_associated :project
  # validates_associated :team
  # validates_associated :student
end
