# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.integer :course_num
      t.string :course_name

      t.timestamps
    end
  end
end
