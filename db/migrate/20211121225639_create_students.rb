class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :course
      t.integer :group
      t.string :activity_name

      t.timestamps
    end
  end
end
