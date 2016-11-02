class AddSlugToCebuSubScheds < ActiveRecord::Migration
  def change
    add_column :cebu_sub_scheds, :slug, :string
  end
end
