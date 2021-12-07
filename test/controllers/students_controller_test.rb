require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:zj)
  end

  test 'should create student from email' do
    assert_difference('Student.count') do
      post students_url, params: { q: 'tan.955@osu.edu' }
    end
    assert_redirected_to navigation_courses_path(found: 'success', student_id: @user.students[0].id)
  end

  test 'should create student from name' do
    assert_difference('Student.count') do
      post students_url, params: { q: 'zj' }
    end
    assert_redirected_to navigation_courses_path(found: 'success', student_id: @user.students[0].id)
  end
end
