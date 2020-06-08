class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follower, class_name: "Relationship",
  					foreign_key: "follower_id",
  					dependent: :destroy
  has_many :followed, class_name: "Relationship",
  					foreign_key: "followed_id",
  					dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :followers_user, through: :followed, source: :follower
  attachment :profile_image


  # ユーザーをフォローする
  def follow(user_id)
  	follower.create(followed_id: user_id)
  end

  # ユーザーをフォロー解除する
  def unfollow(user_id)
  	follower.find_by(followed_id: user_id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(user)
  	following_user.include?(user)
  end
end
