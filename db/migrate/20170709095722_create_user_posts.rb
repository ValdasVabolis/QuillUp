class CreateUserPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_posts do |t|
      t.integer :user_id
      t.string :post_title
      t.text :post_body
      t.timestamps
    end
  end
end
