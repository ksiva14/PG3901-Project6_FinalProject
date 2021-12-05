module ApplicationHelper
    def navbar_project_link
        if request.original_url.include? "teams"
           "/projects?course_id=" + Team.all.find(params[:id]).course.id.to_s
        else 
            "/projects?course_id=" + params[:id].to_s
        end
    end
end
