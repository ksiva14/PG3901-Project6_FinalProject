class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.references  :user, index: true
      t.references  :course, index: true

      t.timestamps
    end
  end
end
