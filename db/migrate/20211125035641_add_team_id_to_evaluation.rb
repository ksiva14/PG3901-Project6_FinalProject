class AddTeamIdToEvaluation < ActiveRecord::Migration[6.1]
  def change
    add_reference :evaluations, :teams, index: true
  end
end
