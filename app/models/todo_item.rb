# == Schema Information
#
# Table name: todo_items
#
#  id           :integer          not null, primary key
#  description  :string
#  completed    :boolean
#  todo_list_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :integer          default("low")
#

class TodoItem < ApplicationRecord
  belongs_to :todo_list
  enum status: {low: 0, medium: 1, high: 2, urgent: 3}
end
