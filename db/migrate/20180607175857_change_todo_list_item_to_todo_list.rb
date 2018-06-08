class ChangeTodoListItemToTodoList < ActiveRecord::Migration[5.2]
  def change
    rename_column :todo_lists, :todo_list_item, :todo_list
  end
end
