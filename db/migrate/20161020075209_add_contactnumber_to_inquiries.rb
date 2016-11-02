class AddContactnumberToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :contactnumber, :string
  end
end
