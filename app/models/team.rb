class Team < ApplicationRecord
  has_many :students
  belongs_to :course, optional: true
end
