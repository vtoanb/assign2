class Inbox < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :messages
end
