class Evaluation < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :team, optional: true
  belongs_to :student, optional: true
end
