class AddAuthorIdToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :author_id, :integer
  end
end
