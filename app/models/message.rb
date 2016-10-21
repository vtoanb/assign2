class Message < ApplicationRecord
  validates :from, presence: true
  validates :to, presence: true
  belongs_to :inbox, dependent: :destroy
end
