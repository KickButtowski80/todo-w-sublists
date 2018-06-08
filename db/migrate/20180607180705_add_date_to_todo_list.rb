class AddDateToTodoList < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :date, :datetime
  end
end
