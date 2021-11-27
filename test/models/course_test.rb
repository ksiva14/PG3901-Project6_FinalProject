require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(course_name: '', course_num: 1, dept_name: '')
  end

  test 'should be valid' do
    assert @course.valid?
  end
end
