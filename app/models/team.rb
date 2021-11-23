class Team < ApplicationRecord
    has_many :students
    validates :team_name, presence: true
end
