# frozen_string_literal: true

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(course_name: 'Course', course_num: 1)
  end

  test 'should be valid' do
    assert @course.valid?
  end

  test 'should not be valid' do
    @course.course_name = ''
    assert_not @course.valid?
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
