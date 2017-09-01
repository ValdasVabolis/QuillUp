FactoryGirl.define do
  factory :message do
    user
    message_chain
    body 'MyText'
  end
end
