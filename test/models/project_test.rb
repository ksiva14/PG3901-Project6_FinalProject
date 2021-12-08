# frozen_string_literal: true

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = Project.new(project_name: 'CSE 3901', course_id: 1)
  end

  test 'should be valid' do
    assert @project.valid?
  end

  # check if things are being assigned and can be accessed.
  test 'check name' do
    project = Project.new(project_name: 'Dan', course_id: 1)
    assert_equal('Dan', project.project_name)
  end
  test 'check name wrong' do
    project = Project.new(project_name: 'Dan', course_id: 1)
    refute_equal('Danny', project.project_name)
  end
  test 'check id' do
    project = Project.new(project_name: 'Dan', course_id: 1)
    assert_equal(1, project.course_id)
  end
  test 'check id wrong' do
    project = Project.new(project_name: 'Dan', course_id: 1)
    refute_equal(2, project.course_id)
  end
end
