require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get login_path
    assert_response :success
  end

  test 'should get delete' do
    get logout_path
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
