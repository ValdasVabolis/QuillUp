class RenamePostToQuestionOnComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :question, foreign_key: true, index: true
  end
end
