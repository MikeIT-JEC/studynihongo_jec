class AddStatusToManilaStudents < ActiveRecord::Migration
  def change
    add_column :manila_students, :status, :integer, default: 0
  end
end
