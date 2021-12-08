# frozen_string_literal: true

class Professor < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :course, optional: true
end
