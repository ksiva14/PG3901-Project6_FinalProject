module StudentsHelper
  def remove_from_course(user_id, course_id)
    Student.where(user_id: user_id).where.not(team_id: nil).each do |student|
      student.destroy if student.team.course_id.to_i == course_id.to_i
    end
  end

  def remove_student_evaluations(user_id, course_id)
    User.find(user_id).students.each do |student|
      # find the student ids in this course
      if !student.team.nil? && student.team.course_id.to_i == course_id.to_i
        Evaluation.where(for_student: student.id).destroy_all
        Evaluation.where(by_student: student.id).destroy_all
      end
    end
  end
end
