class Student < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :team, optional: true

  has_many :evaluations, through: :team
  #Association Validations
  validates_associated :user, :team
end
