require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  def setup
    @team = Team.new(team_name: 'Team 1', course_id: 1)
  end

  test 'valid team' do
    assert @team.valid?
  end

  test 'not a valid team' do
    @team.team_name = ''
    assert_not @team.valid?
  end

  # check if things are being assigned and can be accessed.
  test 'check name' do
    team = Team.new(team_name: 'Dan', course_id: 1)
    assert_equal('Dan', team.team_name)
  end

  test 'check name wrong' do
    team = Team.new(team_name: 'Dan', course_id: 1)
    refute_equal('Danny', team.team_name)
  end

  test 'check id' do
    team = Team.new(team_name: 'Dan', course_id: 1)
    assert_equal(1, team.course_id)
  end

  test 'check id wrong' do
    team = Team.new(team_name: 'Dan', course_id: 1)
    refute_equal(2, team.course_id)
  end
end
