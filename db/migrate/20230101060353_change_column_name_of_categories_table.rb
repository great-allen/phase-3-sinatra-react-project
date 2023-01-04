class ChangeColumnNameOfCategoriesTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :name, :category
  end
end
