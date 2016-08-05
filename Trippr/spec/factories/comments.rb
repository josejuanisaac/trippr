FactoryGirl.define do
  factory :comment do
    content "test content"
    post_id  1
    user_id 1
  end
end