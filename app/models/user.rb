class User < ApplicationRecord
    validates :name, :email, :age, :gender, :phone_number, presence: true
    validates :email, format: {with: /\A[\w.+-]+@\w+\.\w+\z/}
    validates :age, comparison: {greater_than: 0, less_than: 100}
    validates :gender, inclusion: {in: %w(male female other Male Female Other)}
    validates :phone_number, length: { maximum: 15 }

    has_many :posts, dependent: :destroy

    has_secure_password
end
