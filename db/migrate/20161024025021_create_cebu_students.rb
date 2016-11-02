class CreateCebuStudents < ActiveRecord::Migration
  def change
    create_table :cebu_students do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.integer :age
      t.string :contactnumber
      t.string :emailaddress
      t.datetime :datereserved
      t.datetime :dateexpired
      t.integer :cebu_sched_id
      t.string :payment_scheme

      t.timestamps null: false
    end
  end
end
