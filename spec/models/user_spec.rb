require 'rails_helper'

RSpec.describe User, type: :model do

  	# 有効な状態であること
    it "is valid with a name, email, password" do
    	user = User.new(
      		name: "テストユーザー",
      		email: "example@gmail.com",
      		password: "testpass",
        )
      	expect(user).to be_valid
    end
end
