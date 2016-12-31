class Group < ApplicationRecord
	has_many :exhibits
	validates :name, presence: true
end
