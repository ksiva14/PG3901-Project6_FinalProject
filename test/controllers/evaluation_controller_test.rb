require "test_helper"

class EvaluationControllerTest < ActionDispatch::IntegrationTest
  test "should get evaluation_form" do
    get evaluation_evaluation_form_url
    assert_response :success
  end
end
