FactoryBot.define do
  factory :user do
    sequence(:id)
    sequence(:name)  { |n| "テストユーザー#{n}" }
    sequence(:email) { |e| "example#{e}@gmail.com" }
    sequence(:password) { |p| "password#{p}" }
  end
end
