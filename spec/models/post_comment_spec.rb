require 'rails_helper'

RSpec.describe PostComment, type: :model do

  	describe "Valid PostComment" do

  		# ユーザーID、投稿ID、コメントがあれば有効な状態であること
	    it "is valid with an uesr_id, post_id, comment" do
	    	expect(FactoryBot.create(:post_comment)).to be_valid
	    end
	end

	describe "InValid PostComment" do

		# ユーザーIDがなければ無効な状態であること
	    it "is invalid without an user_id" do
	      	post_comment = FactoryBot.build(:post_comment, user_id: nil)
	      	post_comment.valid?
	      	expect(post_comment.errors[:user_id]).to include("を入力してください")
	    end

	    # 投稿IDがなければ無効な状態であること
	    it "is invalid without a post_id" do
	      	post_comment = FactoryBot.build(:post_comment, post_id: nil)
	      	post_comment.valid?
	      	expect(post_comment.errors[:post_id]).to include("を入力してください")
	    end

	    # コメントの文字数が20文字以降なら無効な状態であること
	    it "is invalid if comment is more than 20 characters" do
	    	post_comment = FactoryBot.build(:post_comment, comment: "#{'a' * 21 }")
	    	post_comment.valid?
	    	expect(post_comment.errors[:comment]).to include("は20文字以内で入力してください")
	    end
	end
end
