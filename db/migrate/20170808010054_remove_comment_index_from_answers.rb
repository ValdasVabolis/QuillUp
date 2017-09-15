class RemoveCommentIndexFromAnswers < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :answers, :comment
  end
end
