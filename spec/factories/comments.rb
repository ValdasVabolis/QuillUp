FactoryGirl.define do
  factory :comment do |c|
    c.user
    c.answer
    c.sequence(:body)  { |n| "Body body body blah blah blah #{n}"}    
  end
end
