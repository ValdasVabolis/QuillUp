class AddDeletedToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :deleted, :boolean, default: false
  end
end
