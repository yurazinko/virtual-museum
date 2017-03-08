# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  ancestry    :string
#  photo       :string
#

class Group < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :exhibits
  validates :name, presence: true
  has_ancestry
end
