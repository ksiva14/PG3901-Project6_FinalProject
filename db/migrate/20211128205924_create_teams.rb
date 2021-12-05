class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.text :team_name
      t.references :course, index: true

      t.timestamps
    end
  end
end
