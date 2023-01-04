class ToDoLists < ActiveRecord::Migration[6.1]
  def change
    create_table :to_do_lists do |t|
      t.string :content
      t.integer :category_id
      t.timestamps
    end
  end
end
