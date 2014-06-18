FactoryGirl.define do
  factory :user do
    username      'Test User'
    sequence(:email, 100) { |n| "user#{n}@example.com" }
    password      "helloworld"
  end
end
