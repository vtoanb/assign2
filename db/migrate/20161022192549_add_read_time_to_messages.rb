class AddReadTimeToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :read_time, :datetime
  end
end
