class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 2..30 }
  validates :location, length: { maximum: 30 }, allow_blank: true
  validates :bio, length: { maximum: 300 }, allow_blank: true

  has_many :friends_sender, -> { where confirmed: true }, class_name: "FriendRequest", foreign_key: "user_id"
  has_many :friends_receiver, -> { where confirmed: true }, class_name: "FriendRequest", foreign_key: "friend_id"
  has_many :pending_requests_receiver, -> { where confirmed: false }, class_name: "FriendRequest", foreign_key: "friend_id"
  has_many :pending_requests_sender, -> { where confirmed: false }, class_name: "FriendRequest", foreign_key: "user_id"

  def collect_ids_receiver
    (self.friends_receiver + self.pending_requests_sender).map{ |e| e.user_id }
  end
  
  def collect_ids_sender
    (self.friends_sender + self.pending_requests_sender).map{ |e| e.friend_id }
  end

  def friends
    self.friends_sender + self.friends_receiver
  end
end
