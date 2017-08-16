class AddDeletedToComments < ActiveRecord::Migration[5.1]
  def change
  	change_table :comments do |t|
  		t.boolean :deleted, default: false
  	end
  end
end
