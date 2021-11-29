module CoursesHelper
    def navigation_path (id)
        "/courses/" + id.to_s + "course_navigation"
    end
end
