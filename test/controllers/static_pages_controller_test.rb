require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  test 'should get evaluation' do
    get evaluation_path
=======
  test "should get dashboard" do
    get static_pages_dashboard_url
>>>>>>> 9093f5f88cfda580cb7e298ad3f1a4631206518c
    assert_response :success
  end
end
