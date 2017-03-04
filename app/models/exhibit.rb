# == Schema Information
#
# Table name: exhibits
#
#  id                   :integer          not null, primary key
#  name                 :string
#  description          :text
#  section              :string
#  collection_number    :string
#  inventory_number     :string
#  another_inv_num      :string
#  photo_number         :string
#  dating               :string
#  material             :string
#  size_or_weight       :string
#  condition            :string
#  renewal              :boolean
#  date_of_renewal      :string
#  storage_location     :string
#  locality             :string
#  coordinates          :string
#  museum_director      :string
#  custodian            :string
#  notes                :text
#  date_of_receipt      :string
#  act_of_reception_num :string
#  user_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  photo                :string
#  group_id             :integer
#

class Exhibit < ApplicationRecord
	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

	mount_uploader :photo, PhotoUploader

	belongs_to :group
	belongs_to :user
	geocoded_by :address
	after_validation :geocode
	searchkick

  def as_indexed_json(options={})
	  as_json(
	    only: [:name, :group_id, :description, :section, 
			:collection_number, :inventory_number,
		 	:another_inv_num, :photo, :photo_number, :dating, :material, 
		 	:size_or_weight, :condition, :renewal, :date_of_renewal, :address, :coordinates, :notes,
		 	:storage_location, :locality, :museum_director, :custodian, 
		 	:date_of_receipt, :act_of_reception_num] 
	  )
  end
end
