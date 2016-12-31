class Exhibit < ApplicationRecord
	mount_uploader :photo, PhotoUploader
	belongs_to :group
	belongs_to :user
end
