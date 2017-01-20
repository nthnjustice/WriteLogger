class Goal < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :description, presence: true
	validates :deadline, presence: true
end
