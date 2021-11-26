class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.integer :project_id
      t.integer :student_id
      t.integer :score
      t.string :comment

      t.timestamps
    end
  end
end
