require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  def setup
    @evaluation = Evaluation.new(project_id: 1, student_id: 10, team_id: 1, score: nil, comment: nil)
  end

  test 'should be valid' do
    assert @evaluation.valid?
  end
end
