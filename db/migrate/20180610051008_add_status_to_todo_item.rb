class AddStatusToTodoItem < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_items, :status, :integer, default: 0
  end
end
