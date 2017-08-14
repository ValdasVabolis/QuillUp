class AddTimeStampsToAnswers < ActiveRecord::Migration[5.1]
  def change
    change_table :answers do |t|
      t.datetime :created_at, null: false, default: false
      t.datetime :updated_at, null: false, default: false
    end
  end
end
