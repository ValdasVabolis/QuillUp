class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class ActiveModel::Errors
  def to_h_pro
    Hash[self.keys.map do |k|
      [k, self[k]]
    end]
  end
end
