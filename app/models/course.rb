class Course < ApplicationRecord
  has_many :professors, dependent: :delete_all
  has_many :teams, dependent: :delete_all
  has_many :projects, dependent: :delete_all
end
