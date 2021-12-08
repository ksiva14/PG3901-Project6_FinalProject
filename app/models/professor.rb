class Professor < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :course, optional: true
  #Association Validations
  validates_associated :user, :course
end
