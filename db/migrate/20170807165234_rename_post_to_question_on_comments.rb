class RenamePostToQuestionOnComments < ActiveRecord::Migration[5.1]
  def change
    remove_reference :comments, :post, foreign_key: true, index: true
    add_reference :comments, :question, foreign_key: true, index: true
  end
end
