class Message < ApplicationRecord
  belongs_to :inbox
  has_many :recipients
  has_many :users, through: :recipients
  # intend to build nested form, first need to config this model
  accepts_nested_attributes_for :recipients
end
