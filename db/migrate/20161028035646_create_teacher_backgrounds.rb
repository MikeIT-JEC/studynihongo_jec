class CreateTeacherBackgrounds < ActiveRecord::Migration
  def change
    create_table :teacher_backgrounds do |t|
      t.string :background
      t.references :teacher_information, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
