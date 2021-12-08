# frozen_string_literal: true

# helper methods for evaluations
module EvaluationsHelper
  def get_team_rowspan(team, project)
    if team.students.length > 2
      # Show the evaluations for all students in a team for a particular project %>
      num_student_in_team = team.students.length
      # num_student_in_team to exclude prof evaluations
      num_evaluation_for_team = team.evaluations.where(project_id: project.id).length - num_student_in_team
      num_student_in_team + num_evaluation_for_team + 1 + num_student_in_team
    else
      2
    end
  end

  def get_student_rowspan(team)
    if team.students.length > 2
      team.students.length
    else
      1
    end
  end
end
