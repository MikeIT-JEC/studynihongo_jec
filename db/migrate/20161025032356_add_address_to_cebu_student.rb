class AddAddressToCebuStudent < ActiveRecord::Migration
  def change
    add_column :cebu_students, :address, :string
  end
end
