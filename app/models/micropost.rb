class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :hours, presence: true
  validates :minutes, presence: true
  validates :seconds, presence: true
  validates :author, presence: true
end
