FactoryBot.define do
  factory :post_comment do
    user_id 1
    post_id 1
    comment "これはテストです。"
    association :post
    user { post.user }
  end
end
