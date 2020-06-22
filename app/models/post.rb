class Post < ApplicationRecord
	belongs_to :user
	has_many :post_images, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image
	acts_as_taggable

	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 20 }
	validates :text, length: { maximum: 140 }
	validates :rate, presence: true


	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
