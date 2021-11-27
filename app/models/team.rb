class Team < ApplicationRecord
    has_many :students
    validates :team_name, presence: true
    
  has_many :students
  has_many :evaluations
  belongs_to :course, optional: true
end
