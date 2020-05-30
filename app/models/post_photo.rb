class PostPhoto < ApplicationRecord
	belongs_to :user
	validates :location, length: { maximum: 20 }
	validates :caption, presence: true, length: { minimum: 1, maximum: 200 }
	attachment :photo
end
