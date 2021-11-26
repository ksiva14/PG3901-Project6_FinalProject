require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = Project.new(project_name: 'CSE 3901', course_id: 1)
  end

  test 'should be valid' do
    assert @project.valid?
  end
end
