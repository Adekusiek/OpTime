class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true, length: {maximum: 400}
  validates :user_id, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end
