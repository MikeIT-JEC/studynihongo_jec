class CreateCebuScheds < ActiveRecord::Migration
  def change
    create_table :cebu_scheds do |t|
      t.belongs_to :admin, index: true, foreign_key: true
      t.string :duration
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
