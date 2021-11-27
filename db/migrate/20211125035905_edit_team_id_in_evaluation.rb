class EditTeamIdInEvaluation < ActiveRecord::Migration[6.1]
  def change
    rename_column :evaluations, :teams_id, :team_id
  end
end
