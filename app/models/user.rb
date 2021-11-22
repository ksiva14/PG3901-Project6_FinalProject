class User < ApplicationRecord
  has_many :students, :professors
end
