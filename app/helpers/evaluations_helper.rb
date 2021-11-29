module EvaluationsHelper
  # check if all evaluations is filled by student
  # returns true if all evaluation is filled (score != nil)
  # TODO: use to change can_view. if can_view then student can see result of evaluation
  def evaluations_all_filled?(evaluations)
    evaluations.all? do |evaluation|
      !evaluation.score.nil?
    end
  end

  # check if all evaluations is filled by student
  # TODO: use to change is_assigned. if true then student can start evaluation
  def evaluations_assigned?(evaluations)
    evaluations.all? do |evaluation|
      evaluation.is_assigned == true
    end
  end
end
