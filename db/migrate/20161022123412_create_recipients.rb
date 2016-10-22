class CreateRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipients do |t|
      t.belongs_to :message, foreign_key: true, index: true
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
