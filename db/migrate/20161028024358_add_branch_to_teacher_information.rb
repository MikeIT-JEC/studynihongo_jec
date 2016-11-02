class AddBranchToTeacherInformation < ActiveRecord::Migration
  def change
    add_column :teacher_informations, :branch, :string
  end
end
