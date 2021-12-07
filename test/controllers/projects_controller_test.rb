require 'test_helper'
require 'sessions_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:project1)
  end

  test 'should create my_project' do
    my_project = Project.new(id: '2', project_name: 'hi', course_id: '1')
    assert_difference('Project.count') do
      post '/projects',
           params: { project: { id: my_project.id, project_name: my_project.project_name,
                                course_id: my_project.course_id } }
    end

    assert_redirected_to "/projects?course_id=#{my_project.course_id}"
  end

  test 'should destroy my_project' do
    assert_difference('Project.count', -1) do
      # delete project_url(@my_project)
      delete "/projects/#{@project.id}"
    end
    assert_redirected_to projects_url(course_id: 1)
  end
end
