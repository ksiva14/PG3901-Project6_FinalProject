# frozen_string_literal: true

require 'test_helper'

class ProfessorTest < ActiveSupport::TestCase
  test 'valid professor' do
    professor = Professor.new(user_id: 5, course_id: 1)
    assert professor.valid?
  end
  # check if things are being assigned and can be accessed.
  test 'check user id' do
    professor = Professor.new(user_id: 5, course_id: 1)
    assert_equal(5, professor.user_id)
  end
  test 'check user id wrong' do
    professor = Professor.new(user_id: 5, course_id: 1)
    refute_equal(4, professor.user_id)
  end
  test 'check course id' do
    professor = Professor.new(user_id: 5, course_id: 1)
    assert_equal(1, professor.course_id)
  end
  test 'check course id wrong' do
    professor = Professor.new(user_id: 5, course_id: 1)
    refute_equal(2, professor.course_id)
  end
end
