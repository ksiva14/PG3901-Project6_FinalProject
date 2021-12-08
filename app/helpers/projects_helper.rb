# frozen_string_literal: true

module ProjectsHelper
  # do not create the evaluation if it is already created
  def create_evaluation(project_id, team_id, for_student_id, by_student_id, is_assigned)
    unless Evaluation.all.find_by(project_id: project_id, team_id: team_id, for_student: for_student_id,
                                  by_student: by_student_id).present?

      Evaluation.create project_id: project_id, team_id: team_id, for_student: for_student_id,
                        by_student: by_student_id, score: nil, comment: nil,
                        is_assigned: is_assigned, by_professor: false
    end
  end

  # create blank evaluations for each student for 1 project.
  def create_evaluations_for_project(project_team)
    project_id = project_team.project_id
    team_id = project_team.team_id

    Student.where(team_id: team_id).each do |by_student|
      Student.where(team_id: team_id).where.not(id: by_student.id).each do |for_student|
        # create evaluation for student
        create_evaluation project_id, team_id, for_student.id, by_student.id, true
        # create evaluation for professor
        next if Evaluation.where(project_id: project_id, team_id: team_id, for_student: for_student.id,
                                 is_assigned: false, by_professor: true).present?

        Evaluation.create project_id: project_id, team_id: team_id, for_student: for_student.id,
                          is_assigned: false, by_professor: true
      end
    end
  end

  # create blank evaluations for each project.
  def create_evaluations_for_all_project_teams(course_id)
    Course.find(course_id).projects.each do |project|
      project.project_teams.each do |project_team|
        create_evaluations_for_project(project_team)
        avg_score_of_all_students(project_team)
      end
    end
  end

  def get_avg_score_of_student(evaluation)
    total_score = 0
    num_of_score = 0
    student_evaluations = Evaluation.where(project_id: evaluation.project_id, team_id: evaluation.team_id,
                                           for_student: evaluation.for_student, by_professor: false)
    # calculate avg if all evluations for the student have been filled
    if student_evaluations.where(score: nil, comment: nil).empty?
      student_evaluations.where.not(score: nil).each do |eval|
        total_score += eval.score.to_i
        num_of_score += 1
      end
      total_score / num_of_score unless num_of_score.zero?
    end
  end

  def avg_score_of_all_students(project_team)
    prof_eval = Evaluation.where(project_id: project_team.project_id, team_id: project_team.team_id,
                                 by_professor: true, score: nil)
    prof_eval.each do |evaluation|
      # each evaluation is for a different student
      evaluation.score = get_avg_score_of_student evaluation
      evaluation.save
    end
  end
end
