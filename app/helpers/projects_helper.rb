module ProjectsHelper
  # do not create the evaluation if it is already created
  def create_evaluation(project_id, team_id, for_student, by_student)
    unless Evaluation.all.find_by(project_id: project_id, team_id: team_id, for_student: for_student.id,
                                  by_student: by_student.id).present?

      Evaluation.create project_id: project_id, team_id: team_id, for_student: for_student.id,
                        by_student: by_student.id, score: nil, comment: nil, is_assigned: true
    end
  end

  # create blank evaluations for each student in the course.
  def create_evaluations_for_project(project_team)
    project_id = project_team.project_id
    team_id = project_team.team_id

    Project.find(project_id).project_teams.each do
      Student.where(team_id: team_id).each do |by_student|
        Student.where(team_id: team_id).where.not(id: by_student.id).each do |for_student|
          create_evaluation project_id, team_id, for_student, by_student
        end
      end
    end
  end

  def create_evaluations_for_all_project_teams(course_id)
    Course.find(course_id).projects.each do |project|
      project.project_teams.each do |project_team|
        create_evaluations_for_project(project_team)
      end
    end
  end
end
