require 'test_helper'
require 'sessions_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
   
  end


  test 'should get index' do
    course = Course.new(id: "10", course_name: 'Dan', course_num: '1')
    course.save
    user = User.new(id: "5", name: 'Dan', email: 'Dan@example.com', password: '123456')
    controller.sessions[:user_id] = user.id
    get projects_url(course_id: course.id)
    assert_response :success
  end

  
  test 'should create my_project' do
    my_project = Project.new(id: "2", project_name: 'hi', course_id: "1")
    assert_difference('Project.count') do
      post "/projects", params: { project: {id: my_project.id, project_name: my_project.project_name, course_id: my_project.course_id} }
    end

    assert_redirected_to "/projects?course_id=#{my_project.course_id}"
  end

  test 'should show my_project' do
    my_project = Project.new(id: "6", project_name: 'Dan', course_id: "1")
    get project_url(id: my_project.id)
    assert_response :success
  end

 

  test 'should update my_project' do
    my_project = Project.new(id: "2", project_name: 'hi', course_id: "1")
    patch "/projects/#{my_project.id}/update-project", params: {project:{ id: "2", project_name: "bye", course_id: "4"}}
    assert_redirected_to project_updated_project_url(@my_project)
  end

  test 'should destroy my_project' do
    assert_difference('Project.count', -1) do
      delete project_url(@my_project)
    end

    assert_redirected_to projects_url
  end
end
