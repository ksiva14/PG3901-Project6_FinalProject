module StudentsHelper
    def course_link(courseID)
        "/courses/" + courseID.to_s + "/course_navigation"
    end
end
