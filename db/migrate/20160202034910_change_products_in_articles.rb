class ChangeProductsInArticles < ActiveRecord::Migration
  def change
    change_column_default :articles, :status, "draft"
  end
end
