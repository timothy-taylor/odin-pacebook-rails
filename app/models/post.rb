class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :body, presence: true, length: { maximum: 2000 }

  def fmt_date
    created_at.strftime("%m/%d/%Y %I:%M %p")
  end
end