class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.references :course, index: true
      t.references :team, index: true

      t.timestamps
    end
  end
end
