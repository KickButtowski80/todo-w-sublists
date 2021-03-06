class CreateTodoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_items do |t|
      t.string :description
      t.boolean :completed
      t.integer :status
      t.references :todo_list, foreign_key: true

      t.timestamps
    end
  end
end
