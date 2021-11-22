require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get evaluation' do
    get evaluation_path
    assert_response :success
  end
end
