class CreateUsersPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :users_posts do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
