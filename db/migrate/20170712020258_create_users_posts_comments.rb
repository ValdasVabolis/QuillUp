class CreateUsersPostsComments < ActiveRecord::Migration[5.1]
  def change
    create_table :users_posts_comments do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
