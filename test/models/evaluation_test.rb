# frozen_string_literal: true

require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  def setup
    @evaluation = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
  end

  test 'should be valid' do
    assert @evaluation.valid?
  end

  # check if things are being assigned and can be accessed.
  test 'check project' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    assert_equal(5, eval.project_id)
  end
  test 'check project wrong' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    refute_equal(4, eval.project_id)
  end
  test 'check team' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    assert_equal(1, eval.team_id)
  end
  test 'check team wrong' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    refute_equal(4, eval.team_id)
  end
  test 'check for student' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    assert_equal(2, eval.for_student)
  end
  test 'check for student wrong' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    refute_equal(4, eval.for_student)
  end
  test 'check by student' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    assert_equal(3, eval.by_student)
  end
  test 'check by student wrong' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    refute_equal(4, eval.by_student)
  end
  test 'check score' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    assert_equal(1, eval.score)
  end
  test 'check score wrong' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    refute_equal(4, eval.score)
  end
  test 'check comment' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    assert_equal('hi', eval.comment)
  end
  test 'check comment wrong' do
    eval = Evaluation.new(project_id: 5, team_id: 1, for_student: 2, by_student: 3, score: 1, comment: 'hi')
    refute_equal('bye', eval.comment)
  end
end
