class Post < ApplicationRecord
	belongs_to :user
	has_many :post_images, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :post_image
end
