require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test 'valid student' do
    student = Student.new(user_id: 5, team_id: 1)
    assert student.valid?
  end
  #check if things are being assigned and can be accessed.
  test 'check user id' do
    student = Student.new(user_id: 5, team_id: 1)
    assert_equal(5, student.user_id)
  end
  test 'check user id wrong' do
    student = Student.new(user_id: 5, team_id: 1)
    refute_equal(4, student.user_id)
  end
  test 'check id' do
    student = Student.new(user_id: 5, team_id: 1)
    assert_equal(1, student.team_id)
  end
  test 'check id wrong' do
    student = Student.new(user_id: 5, team_id: 1)
    refute_equal(2, student.team_id)
  end
end