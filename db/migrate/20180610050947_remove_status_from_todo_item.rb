class RemoveStatusFromTodoItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :todo_items, :status, :integer
  end
end
