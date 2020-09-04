require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    @relationship = FactoryBot.create(:relationship, follower_id: user1.id, followed_id: user2.id)
  end

  describe 'Valid Relationship' do
    # follower_id、followed_idがあれば有効な状態であること
    it "is valid with a dfollower_id、followed_id" do
      expect(@relationship).to be_valid
    end
  end

  describe 'InValid Relationship' do
    # follower_idがなければ無効な状態であること
    it "is invalid without a follower_id" do
      @relationship.follower_id = nil
      @relationship.valid?
      expect(@relationship.errors[:follower_id]).to include("を入力してください")
    end

    # followed_idがなければ無効な状態であること
    it "is invalid without a followed_id" do
      @relationship.followed_id = nil
      @relationship.valid?
      expect(@relationship.errors[:followed_id]).to include("を入力してください")
    end
  end
end
