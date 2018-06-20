class AddOwnerToTodoLists < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :owner, :string
  end
end
