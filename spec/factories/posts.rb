FactoryBot.define do
  factory :post do
	user_id 1
  	title   "テスト"
  	rate    0.0
    association :user
  end
end
