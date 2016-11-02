class AddSlugToManilaSubScheds < ActiveRecord::Migration
  def change
    add_column :manila_sub_scheds, :slug, :string
    add_index :manila_sub_scheds, :slug
  end
end
