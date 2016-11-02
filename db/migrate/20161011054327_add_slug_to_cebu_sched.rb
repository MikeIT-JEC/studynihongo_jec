class AddSlugToCebuSched < ActiveRecord::Migration
  def change
    add_column :cebu_scheds, :slug, :string
    add_index :cebu_scheds, :slug
  end
end
