class AddForeignKeys < ActiveRecord::Migration[6.1]
  def change
    # Professor Model
    remove_column :professors, :user_id, :integer
    add_reference :professors, :users, index: true
    remove_column :professors, :course_num, :integer
    add_reference :professors, :courses, index: true
    # Student Model
    remove_column :students, :user_id, :integer
    add_reference :students, :users, index: true
    remove_column :students, :team_id, :integer
    add_reference :students, :teams, index: true
    # Teams Model
    remove_column :teams, :course_num, :integer
    add_reference :teams, :courses, index: true
    # Projects Model
    remove_column :projects, :course_num, :integer
    add_reference :projects, :courses, index: true
  end
end
