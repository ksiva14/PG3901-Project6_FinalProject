module StudentsHelper
  def remove_from_course(user_id, course_id)
    Student.where(user_id: user_id).where.not(team_id: nil).each do |student|
      student.destroy if student.team.course_id.to_i == course_id.to_i
    end
  end
end
