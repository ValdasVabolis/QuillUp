# == Schema Information
#
# Table name: inquiries
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :inquiry do
    name "MyString"
    email "myemail@email.com"
    message "MyText"
  end
end
