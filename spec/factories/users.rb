FactoryBot.define do
  factory :user do
  	sequence(:id) { |n| n }
    name      "テストユーザー"
    email     "example@gmail.com"
    password  "password"
  end
end
