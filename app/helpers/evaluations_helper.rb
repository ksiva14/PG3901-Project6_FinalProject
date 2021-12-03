module EvaluationsHelper
  # check if all evaluations is filled by student
  # TODO: use to change is_assigned. if true then student can start evaluation
  def evaluations_assigned?(evaluations)
    evaluations.all? do |evaluation|
      evaluation.is_assigned == true
    end
  end

  def evaluations_can_view?(evaluations)
    evaluations.all? do |evaluation|
      evaluation.can_view == true
    end
  end
end
