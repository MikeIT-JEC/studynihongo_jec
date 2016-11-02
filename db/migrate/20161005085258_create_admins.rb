class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :role
      t.string :password_hash
      t.string :password_salt

      t.timestamps null: false
    end
  end
end
