class RenameCommentsToAnswers < ActiveRecord::Migration[5.1]
  def change
  	rename_table :comments, :answers
  end
end
