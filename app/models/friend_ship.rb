class FriendShip < ApplicationRecord
  # validates :friend_id, you_not_friend
  belongs_to :friend, class_name: "User"
  belongs_to :you, class_name: "User"

  # def you_not_fiend
  #   self.friend_id == self.you_id ? false : true
  # end
end
