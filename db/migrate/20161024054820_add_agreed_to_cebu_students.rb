class AddAgreedToCebuStudents < ActiveRecord::Migration
  def change
    add_column :cebu_students, :agreed, :boolean, default: false
  end
end
