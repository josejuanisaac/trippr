FactoryGirl.define do
  factory :post do
    body "test body"
    creator_id  1
    event_id 1
    avatar { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
  end
end