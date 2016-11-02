class AddPaymentSchemeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :payment_scheme, :string
  end
end
