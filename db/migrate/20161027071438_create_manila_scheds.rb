class CreateManilaScheds < ActiveRecord::Migration
  def change
    create_table :manila_scheds do |t|
      t.string :duration
      t.integer :status
      t.string :slug
      t.references :admin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
