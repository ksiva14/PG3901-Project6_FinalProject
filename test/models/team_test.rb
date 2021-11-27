require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  def setup
    @team = Team.new(team_name: '', course_id: 1)
  end

  test 'should be valid' do
    assert @team.valid?
  end
end
