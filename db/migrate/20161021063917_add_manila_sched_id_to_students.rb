class AddManilaSchedIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :manila_sched_id, :integer
  end
end
