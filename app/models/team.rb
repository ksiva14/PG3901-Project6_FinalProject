class Team < ApplicationRecord
  
  has_many :students
  has_many :evaluations
  belongs_to :course, optional: true
end
