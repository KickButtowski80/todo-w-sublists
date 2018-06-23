# == Schema Information
#
# Table name: todo_lists
#
#  id         :integer          not null, primary key
#  todo_list  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  date       :datetime
#  owner      :string
#

class TodoList < ApplicationRecord
    belongs_to :user
    has_many :todo_items
    validates :todo_list, presence: true, length: { minimum: 5}
end
