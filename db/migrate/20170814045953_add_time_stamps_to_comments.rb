class AddTimeStampsToComments < ActiveRecord::Migration[5.1]
  def change
    change_table :comments do |t|
      t.datetime :created_at, null: false, default: Time.now
      t.datetime :updated_at, null: false, default: Time.now
    end
  end
end
