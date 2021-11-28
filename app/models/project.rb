class Project < ApplicationRecord
  belongs_to :course
  belongs_to :team
end
