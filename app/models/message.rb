class Message < ApplicationRecord
  validates :from, presence: true
  belongs_to :inbox, dependent: :destroy
  belongs_to :user
end
