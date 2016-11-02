class AddCsStartsToCebuSubScheds < ActiveRecord::Migration
  def change
    add_column :cebu_sub_scheds, :cs_starts, :string
  end
end
