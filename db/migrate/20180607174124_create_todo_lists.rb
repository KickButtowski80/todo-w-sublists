class CreateTodoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_lists do |t|
      t.string :todo_list_item

      t.timestamps
    end
  end
end
