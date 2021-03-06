# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  role                   :integer
#

class User < ApplicationRecord
  #  enum role: [:user, :vip, :admin]
  #  after_initialize :set_default_role, :if => :new_record?

  #  def set_default_role
  #    self.role ||= :user
  #  end
  ROLES = ['user', 'admin']
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :exhibits
  has_many :groups
  has_many :articles
  #  validates :name, presence: true
  ROLES.each do |rolename|
    define_method "#{rolename}?" do
      self.role == rolename
    end
  end
end
