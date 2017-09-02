FactoryGirl.define do
  factory :answer do |c|
    user
    question
    sequence(:body) { |n| "Lawyer up. Hit the gym. Delete facebook. I'm #{n} btw"}
  end
end
