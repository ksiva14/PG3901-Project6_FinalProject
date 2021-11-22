class ChangeColName < ActiveRecord::Migration[6.1]
  def change
    # Professor Model
    rename_column :professors, :users_id, :user_id
    rename_column :professors, :courses_id, :course_id
    # Student Model
    rename_column :students, :users_id, :user_id
    rename_column :students, :teams_id, :team_id
    # Teams Model
    rename_column :teams, :courses_id, :course_id
    # Projects Model
    rename_column :projects, :courses_id, :course_id
  end
end
