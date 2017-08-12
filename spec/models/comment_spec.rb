# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :integer

require 'rails_helper'

describe Comment do

  it 'saves when valid' do
    question = build(:question)
    answer = build(:answer)
    answer.question = question
    c = build(:comment)
    answer.comments << c
    expect(c.save).to be true
  end

end
