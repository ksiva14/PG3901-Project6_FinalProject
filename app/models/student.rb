class Student < ApplicationRecord
    belongs_to :team, :optional => true
    validates :name, presence: true
    validates :email, presence: true, format: { with: /[0-9a-zA-Z.]+@[0-9a-zA-Z]+\.[0-9a-zA-Z]+/ }
    validates :group, presence: true


end
