class EditCourseProfessorTeamModels < ActiveRecord::Migration[6.1]
  def change
    # Course Model
    add_column :courses, :course_num, :integer
    add_column :courses, :dept_name, :string
    # Professor Model
    remove_column :professors, :name, :string
    rename_column :professors, :course, :course_num
    add_column :professors, :user_id, :integer
    # Teams Model
    add_column :teams, :course_num, :integer
  end
end
