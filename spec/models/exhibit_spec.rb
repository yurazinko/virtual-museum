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

require 'rails_helper'

RSpec.describe Exhibit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
