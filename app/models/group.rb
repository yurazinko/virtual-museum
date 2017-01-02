class Group < ApplicationRecord
	has_many :exhibits
	validates :name, presence: true
	has_ancestry
end
