require 'test_helper'

class ProjectTeamTest < ActiveSupport::TestCase
  test 'valid project_team' do
    project_team = ProjectTeam.new(project_id: 5, team_id: 1)
    assert project_team.valid?
  end
  # check if things are being assigned and can be accessed.
  test 'check project id' do
    project_team = ProjectTeam.new(project_id: 5, team_id: 1)
    assert_equal(5, project_team.project_id)
  end
  test 'check project id wrong' do
    project_team = ProjectTeam.new(project_id: 5, team_id: 1)
    refute_equal(4, project_team.project_id)
  end
  test 'check team id' do
    project_team = ProjectTeam.new(project_id: 5, team_id: 1)
    assert_equal(1, project_team.team_id)
  end
  test 'check team id wrong' do
    project_team = ProjectTeam.new(project_id: 5, team_id: 1)
    refute_equal(2, project_team.team_id)
  end
end
