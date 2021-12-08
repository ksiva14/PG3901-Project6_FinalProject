# frozen_string_literal: true

module ApplicationHelper
  def navbar_project_link
    if request.original_url.include? 'teams'
      "/projects?course_id=#{Team.all.find(params[:id]).course.id}"
    else
      "/projects?course_id=#{params[:id]}"
    end
  end
end
