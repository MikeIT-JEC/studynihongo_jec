class AddStatusToCebuStudents < ActiveRecord::Migration
  def change
    add_column :cebu_students, :status, :integer, default: 0
  end
end
