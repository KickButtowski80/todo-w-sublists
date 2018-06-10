# == Schema Information
#
# Table name: todo_lists
#
#  id         :integer          not null, primary key
#  todo_list  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  date       :datetime
#

class TodoList < ApplicationRecord
    has_many :todo_items
    validates :todo_list, presence: true, length: { minimum: 5}
end
