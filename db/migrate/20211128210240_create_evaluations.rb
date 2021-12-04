class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.references :project, index: true
      t.references :team, index: true
      t.integer :for_student
      t.integer :by_student
      t.boolean :by_professor
      t.integer :score
      t.string :comment
      t.boolean :is_assigned
      t.boolean :can_view

      t.timestamps
    end
  end
end
