class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.references :project, index: true
      t.references :team, index: true
      t.integer :for_student
      t.integer :by_student
      t.integer :score
      t.string :comment

      t.timestamps
    end
  end
end
