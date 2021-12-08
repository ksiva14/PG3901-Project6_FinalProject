# frozen_string_literal: true

require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:course1)
  end

  test 'should update course' do
    put update_courses_path(id: @course.id), params: { course: { course_name: 'Course 2', course_num: 5 } }
    assert_redirected_to courses_url
  end

  test 'should destroy course' do
    assert_difference('Course.count', -1) do
      delete courses_url(id: @course.id)
    end
    assert_redirected_to courses_url
  end
end
