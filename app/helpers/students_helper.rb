module StudentsHelper
  def remove_from_course(user_id, course_id)
    Student.where(user_id: user_id).each do |student|
      student.destroy if student.team.course.id == course_id
    end
  end
end
