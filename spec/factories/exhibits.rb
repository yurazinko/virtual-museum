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

FactoryGirl.define do
  factory :exhibit do
    name "MyString"
    fond_group ""
    section ""
    collection_number 1
    inventory_number 1
    another_inv_num 1
    photo_number 1
    dating "MyString"
    material "MyString"
    size_or_weight "MyString"
    condition "MyString"
    renewal false
    date_of_renewal "MyString"
    storage_location "MyString"
    locality "MyString"
    museum_director "MyString"
    custodian "MyString"
    date_of_receipt "MyString"
    act_of_reception_num 1
  end
end
