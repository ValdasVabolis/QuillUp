FactoryGirl.define do
  factory :post do |p|
    p.user
    p.sequence(:title)  { |n| "Title title title #{n}" }
    p.sequence(:body)  { |n| "Body body body blah blah blah #{n}"}
  end
end