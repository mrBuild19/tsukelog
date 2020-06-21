class Post < ApplicationRecord
	belongs_to :user
	has_many :post_images, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image
	acts_as_taggable

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
