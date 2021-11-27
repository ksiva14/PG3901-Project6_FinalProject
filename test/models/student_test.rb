require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    @student = Student.new(user_id: 1, team_id: 1)
  end

  test 'should be valid' do
    assert @student.valid?
  end
end
