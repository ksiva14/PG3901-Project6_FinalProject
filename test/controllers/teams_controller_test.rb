require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:team1)
  end

  test 'should show team' do
    get team_url(@team)
    assert_response :success
  end

  test 'should update team' do
    patch team_url(@team), params: { team: {} }
    assert_redirected_to navigation_courses_path(id: @team.course_id)
  end

  test 'should destroy team' do
    assert_difference('Team.count', -1) do
      delete team_url(@team)
    end

    assert_redirected_to "/courses/#{@team.course_id}/course_navigation"
  end
end
