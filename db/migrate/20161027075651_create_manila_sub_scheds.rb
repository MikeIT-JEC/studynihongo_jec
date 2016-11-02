class CreateManilaSubScheds < ActiveRecord::Migration
  def change
    create_table :manila_sub_scheds do |t|
      t.references :manila_sched, index: true, foreign_key: true
      t.references :admin, index: true, foreign_key: true
      t.string :ms_day
      t.string :ms_session
      t.string :ms_time
      t.string :ms_jlpt_level
      t.integer :ms_status
      t.integer :ms_slots
      t.string :ms_starts
      t.string :slug

      t.timestamps null: false
    end
  end
end
