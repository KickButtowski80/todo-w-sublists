class List < Node
    has_many :items, dependent: :destroy
    alias_attribute :title, :description

    validates :title, presence: true
end
