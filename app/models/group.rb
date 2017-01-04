class Group < ApplicationRecord
	mount_uploader :photo, PhotoUploader
	belongs_to :user
	has_many :exhibits
	validates :name, presence: true
	has_ancestry
end
