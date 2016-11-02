class AddAdminIdToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :admin, index: true, foreign_key: true
  end
end
