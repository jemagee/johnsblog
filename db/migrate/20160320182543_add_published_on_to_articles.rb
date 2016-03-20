class AddPublishedOnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published_on, :date, default: nil
  end
end
