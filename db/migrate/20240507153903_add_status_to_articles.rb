20240507153903_add_status_to_articles.rbclass AddStatusToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :status, :string
  end
end
