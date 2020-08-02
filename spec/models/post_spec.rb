require 'rails_helper'

RSpec.describe Post, type: :model do

	describe "Valid Post" do

	  	# ユーザーID、タイトル、レートがあれば有効な状態であること
	    it "is valid with an uesr_id, title, rate" do
	    	expect(FactoryBot.build(:post)).to be_valid
	    end

	    # レートの初期値が0.0であること
	    it "initial rate is 0.0" do
	    	expect(FactoryBot.build(:post, rate: 0.0).rate).to eq 0.0
	    end
	end

	describe "Invalid Post" do

	    # ユーザーIDがなければ無効な状態であること
	    it "is invalid without a user_id" do
	    	post = FactoryBot.build(:post, user_id: nil)
	    	post.valid?
	    	expect(post.errors[:user_id]).to include("を入力してください")
	    end

	    # タイトルがなければ無効な状態であること
	    it "is invalid without the title" do
	    	post = FactoryBot.build(:post, title: nil)
	    	post.valid?
	    	expect(post.errors[:title]).to include("を入力してください")
	    end

	    # 投稿タイトルの文字数が20文字以降なら無効な状態であること
	    it "is invalid if title is more than 20 characters" do
	    	post = FactoryBot.build(:post, title: "#{'a' * 21 }")
	    	post.valid?
	    	expect(post.errors[:title]).to include("は20文字以内で入力してください")
	    end

	    # 投稿テキストの文字数が140文字以降なら無効な状態であること
	    it "is invalid if text is more than 140 characters" do
	    	post = FactoryBot.build(:post, text: "#{'a' * 141 }")
	    	post.valid?
	    	expect(post.errors[:text]).to include("は140文字以内で入力してください")
	    end

	    # レートがなければ無効な状態であること
	    it "is invalid without a rate" do
	    	post = FactoryBot.build(:post, rate: nil)
	    	post.valid?
	    	expect(post.errors[:rate]).to include("を入力してください")
	    end
	end

	describe "Delete" do

		before do
			@post = FactoryBot.create(:post)
		end

	    # 投稿を削除できること
	    it "can delete" do
	    	post_count = Post.where(user_id: @post.user.id).length
	      	expect(post_count).to be >= 1

	      	Post.find_by(user_id: @post.user.id).destroy
	      	expect(Post.where(user_id: @post.user.id).length).to eq post_count - 1
	    end

	    # userを削除すると紐付いた投稿も削除されること
	    it "is deleted the associated posts if delete the user" do
	      	expect(Post.where(user_id: @post.user.id).length).to be >= 1

	      	User.find(@post.user.id).destroy
	      	expect(Post.where(user_id: @post.user.id).length).to be == 0
	    end
	end
end
