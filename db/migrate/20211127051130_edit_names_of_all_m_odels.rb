class EditNamesOfAllMOdels < ActiveRecord::Migration[6.1]
  def change
    rename_column :professors, :users_id, :user_id
    rename_column :professors, :courses_id, :course_id
    rename_column :projects, :courses_id, :course_id
    rename_column :students, :users_id, :user_id
    rename_column :students, :teams_id, :team_id
    rename_column :teams, :courses_id, :course_id
  end
end
