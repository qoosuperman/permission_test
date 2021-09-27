class PermissionGroup < ApplicationRecord
  has_many :permission_group_references, dependent: :destroy
  has_many :permission_group_teams, dependent: :destroy, autosave: :true
  has_many :teams, through: :permission_group_teams
  has_many :permissions, through: :permission_group_references
end
