class Professor < ApplicationRecord
    belongs_to :user, :course
end
