class CreateTeacherQualifications < ActiveRecord::Migration
  def change
    create_table :teacher_qualifications do |t|
      t.string :qualification
      t.references :teacher_information, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
