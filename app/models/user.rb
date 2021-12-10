class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [ :github ]

  validates :name, presence: true, length: { maximum: 20 }
  validates :location, length: { maximum: 20 }, allow_blank: true
  validates :bio, length: { maximum: 300 }, allow_blank: true

  has_many :friends_sender, -> { where confirmed: true }, class_name: "FriendRequest", foreign_key: "user_id", dependent: :destroy
  has_many :friends_receiver, -> { where confirmed: true }, class_name: "FriendRequest", foreign_key: "friend_id", dependent: :destroy
  has_many :pending_requests_receiver, -> { where confirmed: false }, class_name: "FriendRequest", foreign_key: "friend_id", dependent: :destroy
  has_many :pending_requests_sender, -> { where confirmed: false }, class_name: "FriendRequest", foreign_key: "user_id", dependent: :destroy

  has_one_attached :photo, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def any_connection?(user)
    ids = self.friends_sender.pluck(:friend_id) + self.friends_receiver.pluck(:user_id) + self.pending_requests_sender.pluck(:friend_id) + self.pending_requests_receiver.pluck(:user_id)
    ids.any? { |id| id.eql?(user.id) }
  end

  def friends
    self.friends_sender + self.friends_receiver
  end

  def friends_ids
    self.friends_sender.pluck(:friend_id) + self.friends_receiver.pluck(:user_id) + [self.id]
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.nickname
      user.password = Devise.friendly_token[0,20]
      user.photo = auth.info.image
      user.location = auth.info.location
      user.bio = auth.info.description
    end
  end
end
