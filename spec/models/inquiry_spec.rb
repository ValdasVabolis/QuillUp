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

require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
