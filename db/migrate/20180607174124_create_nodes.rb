class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.string      :type
      t.references  :list
      t.string      :description
      t.boolean     :completed
      t.integer     :status, default: 0
      t.timestamps
    end
  end
end
