class RenameColsFromStudent < ActiveRecord::Migration[6.1]
  def change
    rename_column :students, :group, :user_id
    rename_column :students, :course, :team_id
  end
end
