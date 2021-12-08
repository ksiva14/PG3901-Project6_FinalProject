# frozen_string_literal: true

require 'test_helper'
require 'sessions_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test 'should create my_project' do
    my_project = Project.new(id: '2', project_name: 'hi', course_id: '1')
    assert_difference('Project.count') do
      post '/projects',
           params: { project: { id: my_project.id, project_name: my_project.project_name,
                                course_id: my_project.course_id } }
    end

    assert_redirected_to "/projects?course_id=#{my_project.course_id}"
  end
end
