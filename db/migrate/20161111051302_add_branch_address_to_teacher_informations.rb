class AddBranchAddressToTeacherInformations < ActiveRecord::Migration
  def change
    add_column :teacher_informations, :branch_address, :string
  end
end
