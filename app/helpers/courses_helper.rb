module CoursesHelper
  def navigation_path(id)
    '/courses/' + id.to_s + '/course_navigation'
  end

  def new_course_team(id)
    '/courses/' + id.to_s + '/course_navigation/new_team'
  end

  def new_course_student(id)
    '/courses/' + id.to_s + '/course_navigation/new_student'
  end
end
