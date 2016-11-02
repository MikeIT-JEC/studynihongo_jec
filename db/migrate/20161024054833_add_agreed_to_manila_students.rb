class AddAgreedToManilaStudents < ActiveRecord::Migration
  def change
    add_column :manila_students, :agreed, :boolean, default: false
  end
end
