class Node < ApplicationRecord
  enum status: {low: 0, medium: 1, high: 2, urgent: 3}
end
