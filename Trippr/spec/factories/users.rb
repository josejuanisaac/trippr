FactoryGirl.define do
  factory :user do
    email "test email"
    username  "test username"
    password "test password"
    password_confirmation "test password"
  end
end