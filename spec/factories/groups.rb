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

FactoryGirl.define do
  factory :group do
    name "MyString"
    description "MyText"
  end
end
