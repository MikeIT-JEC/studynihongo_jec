class CreateCebuSubScheds < ActiveRecord::Migration
  def change
    create_table :cebu_sub_scheds do |t|
      t.belongs_to :cebu_sched, index: true, foreign_key: true
      t.integer :admin_id
      t.string :cs_day
      t.string :cs_session
      t.string :cs_time
      t.string :cs_jlpt_level
      t.integer :cs_status, default: 0
      t.integer :cs_slots

      t.timestamps null: false
    end
  end
end
