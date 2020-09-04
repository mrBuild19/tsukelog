require 'rails_helper'

RSpec.describe User, type: :model do
  # 名前、メール、パスワードがあれば有効な状態であること
  it "is valid with a name, email, password" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  # 初期状態では管理者権限を持っていないこと
  it "don't have administrator authority" do
    expect(FactoryBot.build(:user).admin).to eq false
  end

  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  # 名前の文字数が3文字未満なら無効な状態であること
  it "is invalid if name is less than 3 characters" do
    user = FactoryBot.build(:user, name: "aa")
    user.valid?
    expect(user.errors[:name]).to include("は3文字以上で入力してください")
  end

  # 名前の文字数が20文字以降なら無効な状態であること
  it "is invalid if name is more than 20 characters" do
    user = FactoryBot.build(:user, name: "#{'a' * 21}")
    user.valid?
    expect(user.errors[:name]).to include("は20文字以内で入力してください")
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "duplicate@gmail.com")
    user = FactoryBot.build(:user, email: "duplicate@gmail.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  # パスワードがなければ無効な状態であること
  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  # パスワードの文字数が6文字未満なら無効な状態であること
  it "is invalid if password is less than 6 characters" do
    user = FactoryBot.build(:user, password: "#{'a' * 5}")
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  # パスワードの文字数が20文字以降なら無効な状態であること
  it "is invalid if password is more than 128 characters" do
    user = FactoryBot.build(:user, password: "#{'a' * 129}")
    user.valid?
    expect(user.errors[:password]).to include("は128文字以内で入力してください")
  end
end
