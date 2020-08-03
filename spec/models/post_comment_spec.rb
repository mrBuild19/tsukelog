require 'rails_helper'

RSpec.describe PostComment, type: :model do

  	describe "Valid PostComment" do

  		before do
  			@comment = FactoryBot.create(:post_comment)
  		end

  		# ユーザーID、投稿ID、コメントがあれば有効な状態であること
	    it "is valid with an uesr_id, post_id, comment" do
	    	expect(@comment).to be_valid
	    end
	end

	describe "InValid PostComment" do

	end
end
