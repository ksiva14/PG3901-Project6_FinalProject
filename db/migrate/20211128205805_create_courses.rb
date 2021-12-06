class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.integer :course_num
      t.text :course_name

      t.timestamps
    end
  end
end
