class RemoveCommentIndexFromAnswers < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :answers, :comment, foreign_key: true, index: true
  end
end
