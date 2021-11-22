require 'test_helper'

class EvaluationControllerTest < ActionDispatch::IntegrationTest
  test 'should get evaluation_form' do
    get evaluation_form_path
    assert_response :success
  end
end
