class AddSlugToManilaScheds < ActiveRecord::Migration
  def change
    add_column :manila_scheds, :slug, :string
    add_index :manila_scheds, :slug
  end
end
