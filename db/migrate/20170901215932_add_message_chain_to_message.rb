class AddMessageChainToMessage < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :message_chain, index: true, foreign_key: true
  end
end
