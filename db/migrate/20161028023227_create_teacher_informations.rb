class CreateTeacherInformations < ActiveRecord::Migration
  def change
    create_table :teacher_informations do |t|
      t.string :name
      t.string :age
      t.string :address
      t.string :contact_number
      t.string :emailaddress

      t.timestamps null: false
    end
  end
end
