class AddReadsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :reads, :integer, default: 0
  end
end
