class CreateMessageChains < ActiveRecord::Migration[5.1]
  def change
    create_table :message_chains do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
