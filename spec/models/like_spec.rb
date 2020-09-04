require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Valid Like' do
    before do
      @like = FactoryBot.create(:like)
    end

    # ユーザーID、投稿IDがあれば有効な状態であること
    it "is valid with an user_id, post_id" do
      expect(@like).to be_valid
    end
  end

  describe 'InValid Like' do
    # ユーザーIDがなければ無効な状態であること
    it "is invalid without an user_id" do
      like = FactoryBot.build(:like, user_id: nil)
      like.valid?
      expect(like.errors[:user_id]).to include("を入力してください")
    end

    # 投稿IDがなければ無効な状態であること
    it "is invalid without a post_id" do
      like = FactoryBot.build(:like, post_id: nil)
      like.valid?
      expect(like.errors[:post_id]).to include("を入力してください")
    end
  end
end
