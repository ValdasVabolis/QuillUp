FactoryGirl.define do
  factory :comment do |c|
    c.user
    c.post
    c.sequence(:body) { |n| "Lawyer up. Hit the gym. Delete facebook. I'm #{n} btw"}
  end

end

# contract!!!!! user should be able to tag donkey pictures

# /^user shouuld.....$/ do
  #

# sign in user
#click on picturews link
#click on donkeys albuym
#submit tag