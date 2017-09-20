class AddPinToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :pin, :boolean, default: false
  end
end
