FactoryGirl.define do
  factory :answer do |c|
    c.user
    c.question
    c.sequence(:body) { |n| "Lawyer up. Hit the gym. Delete facebook. I'm #{n} btw"}
  end

end
