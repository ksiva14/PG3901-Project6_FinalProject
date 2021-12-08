# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get signupstudents' do
    get '/signupstudents'
    assert_response :success
  end

  test 'should get signupprofessors' do
    get '/signupprofessors'
    assert_response :success
  end

  test 'can create a student' do
    get '/signupstudents'
    assert_response :success

    post '/signupstudents', params: { user: { name: 'Student', email: 'student.1@osu.edu', password_digest: '1234' } }
    assert_response :success
  end

  test 'can create a professor' do
    get '/signupprofessors'
    assert_response :success

    post '/signupprofessors',
         params: { user: { name: 'Professor', email: 'professor.1@osu.edu', password_digest: '1234' } }
    assert_response :success
  end
end
