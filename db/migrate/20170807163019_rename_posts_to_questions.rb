class RenamePostsToQuestions < ActiveRecord::Migration[5.1]
  def change
    rename_table :posts, :questions
  end 
end
