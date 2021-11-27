class RemoveColsFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :name, :string
    remove_column :students, :email, :string
    remove_column :students, :password_digest, :string
    remove_column :students, :activity_name, :string
  end
end
