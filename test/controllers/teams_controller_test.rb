require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:one)
  end

  test 'should create team' do
    post teams_url, params: { team: {} }
    assert_response :redirect
    assert_redirected_to '/courses/navigation'
    
  end

  test 'should show team' do
    get team_url(@team)
    assert_response :success
  end

  test 'should update team' do
    patch team_url(@team), params: { team: {} }
    assert_redirected_to '/courses/navigation'
  end

  test 'should destroy team' do
    assert_difference('Team.count', -1) do
      delete team_url(@team)
    end

    assert_redirected_to '/courses//course_navigation'
  end
end
