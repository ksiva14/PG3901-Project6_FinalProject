class AddReferenceToTeamInProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :team, index: true
  end
end
