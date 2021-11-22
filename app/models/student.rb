class Student < ApplicationRecord
  belongs_to :user, :team
end
