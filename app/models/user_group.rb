class UserGroup < ApplicationRecord
  has_many :users
  has_many :group_permissions, dependent: :destroy
  # accepts_nested_attributes_for :group_permissions
  has_many :permission_resources, through: :group_permissions
  has_many :enabled_permissions, -> { enable }, class_name: 'GroupPermission'
  has_many :enabled_resources, through: :enabled_permissions
end