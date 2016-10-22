class Message < ApplicationRecord
  belongs_to :inbox, dependent: :destroy
  belongs_to :user
end
