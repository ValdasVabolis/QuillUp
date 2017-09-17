FactoryGirl.define do |f|
  factory :user do |u|
    u.sequence(:username) { |n| "user#{n}" }
    u.sequence(:email) { |n| "email#{n}@example.com" }
    u.password "password"
    u.password_confirmation "password"
    after(:create) { |user| user.confirm }
  end
end
