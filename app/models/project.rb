class Project < ApplicationRecord
  belongs_to :course, optional: true
end
