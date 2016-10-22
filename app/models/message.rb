class Message < ApplicationRecord
  belongs_to :inbox
  has_many :recipients
  has_many :users, through: :recipients
end
