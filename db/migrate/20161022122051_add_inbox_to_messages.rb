class AddInboxToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :inbox, foreign_key: true
  end
end
