class TodoItem < ApplicationRecord
  belongs_to :todo_list
  enum status: {low: 0, medium: 1, high: 2, urgent: 3}
end
