class AddDetailsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :from, :string
    add_column :messages, :to, :string
  end
end
