class Group < ApplicationRecord
	mount_uploader :photo, PhotoUploader
	has_many :exhibits
	validates :name, presence: true
	has_ancestry
end
