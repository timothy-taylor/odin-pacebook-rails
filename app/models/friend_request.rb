class FriendRequest < ApplicationRecord
  belongs_to :receiver, class_name: "User", foreign_key: "friend_id"
  belongs_to :sender, class_name: "User", foreign_key: "user_id"
end
