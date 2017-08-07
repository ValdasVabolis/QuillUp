class RenamePostToQuestionOnComments < ActiveRecord::Migration[5.1]
  def change
    remove_reference :comments, :post
    add_reference :comments, :question
  end
end
