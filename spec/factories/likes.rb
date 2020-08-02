FactoryBot.define do
  factory :like do
    user_id 1
  	post_id 1
  	association :post
  end
end
