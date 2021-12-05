require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'valid course' do
    course = Course.new(course_name: 'Dan', course_num: '1')
    assert course.valid?
  end
  # check if things are being assigned and can be accessed.
  test 'check course_name' do
    course = Course.new(course_name: 'Dan', course_num: '1')
    assert_equal('Dan', course.course_name)
  end
  test 'check course_name wrong' do
    course = Course.new(course_name: 'Dan', course_num: '1')
    refute_equal('Danny', course.course_name)
  end
  test 'check num' do
    course = Course.new(course_name: 'Dan', course_num: 1)
    assert_equal(1, course.course_num)
  end
  test 'check num wrong' do
    course = Course.new(course_name: 'Dan', course_num: 1)
    refute_equal(2, course.course_num)
  end
end
