class AddDeletedToPosts < ActiveRecord::Migration[5.1]
  def change
    change_table :posts do |t|
      t.boolean :deleted, default: false
    end
  end
end
