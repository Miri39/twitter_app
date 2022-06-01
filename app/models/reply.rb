class Reply < ApplicationRecord
    belongs_to :user
    belongs_to :comm
    
    default_scope -> {order(created_at: :desc)}
    validates :text, presence: true, length: {maximum: 120}

end
