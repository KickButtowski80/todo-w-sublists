class Item < Node
  belongs_to :list
  enum status: {low: 0, medium: 1, high: 2, urgent: 3}
  
  validates :description, presence: true
end
