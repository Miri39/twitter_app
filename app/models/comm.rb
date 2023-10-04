class Comm < ApplicationRecord
    belongs_to :user
    belongs_to :post
    default_scope -> {order(created_at: :desc)}
    validates :text, presence: true, length: {maximum: 120}

    has_many :replies, dependent: :destroy
    has_many :likes, dependent: :destroy
end
