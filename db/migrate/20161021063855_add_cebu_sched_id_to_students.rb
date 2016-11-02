class AddCebuSchedIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :cebu_sched_id, :integer
  end
end
