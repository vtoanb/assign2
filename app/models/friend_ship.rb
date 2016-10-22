class FriendShip < ApplicationRecord
  belongs_to :friend, class_name: "User"
  belongs_to :you, class_name: "User"
end
