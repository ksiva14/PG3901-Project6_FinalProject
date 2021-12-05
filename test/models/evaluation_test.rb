require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  test 'valid eval' do
    eval = Evaluation.new(project_id: 1, team_id: 2, for_student: 1, by_student: 2, score: 1, comment: 'hi')
    assert eval.valid?
  end
  # check if things are being assigned and can be accessed.
end
