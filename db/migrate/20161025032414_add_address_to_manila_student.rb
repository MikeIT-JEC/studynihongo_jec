class AddAddressToManilaStudent < ActiveRecord::Migration
  def change
    add_column :manila_students, :address, :string
  end
end
