class Project < ApplicationRecord
  belongs_to :course, optional: true
  belongs_to :team, optional: true
  has_many :evaluations
end
