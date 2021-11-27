class Evaluation < ApplicationRecord
  # If you set the :optional option to true, then the presence of the associated object won't be validated.
  # By default, this option is set to false.
  belongs_to :project, optional: true
  belongs_to :team, optional: true
  belongs_to :student, optional: true

  # TODO: delete later
  # validates :name, length: { minimum: 2 } # or { maximum: 500 } or { in: 6..20 } or { is: 6 }
  # validates :name, :login, :email, presence: true
  # validates :email, uniqueness: true
  # validates :switch, inclusion: { in: [true, false]  }
  # validates :terms_of_service, acceptance: true
  # validates :size, inclusion: { in: %w(small medium large), message: "%{value} is not a valid size" }
  # validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
