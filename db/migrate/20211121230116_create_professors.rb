class CreateProfessors < ActiveRecord::Migration[6.1]
  def change
    create_table :professors do |t|
      t.string :name
      t.integer :course

      t.timestamps
    end
  end
end
