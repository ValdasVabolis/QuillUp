FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email) { |n| "email#{n}@example.com" }
    u.password "password"
    u.password_confirmation "password"
  end
end