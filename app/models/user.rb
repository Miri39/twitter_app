class User < ApplicationRecord
    validates :name, :email, :age, :gender, :phone_number, presence: true
    validates :email, format: {with: /\A[\w.+-]+@\w+\.\w+\z/}
    validates :age, comparison: {greater_than: 0, less_than: 100}
    validates :gender, inclusion: {in: %w(male female other Male Female Other)}
    validates :phone_number, length: { maximum: 15 }

    has_many :posts, dependent: :destroy
    has_many :comms, dependent: :destroy
    has_many :replies, dependent: :destroy
    has_many :likes, dependent: :destroy

    has_many :follower_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
    has_many :followed_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  
    has_many :following, through: :follower_relationships, source: :followed
    has_many :followers, through: :followed_relationships, source: :follower

    has_secure_password

    # follows a user
  def follow(other_user)
    following << other_user
  end

  # unfollows a user
  def unfollow(other_user)
    following.delete(other_user)
  end

  # returns true if the current user is following the other user
  def following?(other_user)
    following.include?(other_user)
  end

end
