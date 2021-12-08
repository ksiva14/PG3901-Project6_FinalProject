# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :professors, dependent: :delete_all
  has_many :teams, dependent: :delete_all
  has_many :projects, dependent: :delete_all

  validates :course_name, presence: true
  validates :course_num, presence: true, numericality: { only_integer: true }
end
