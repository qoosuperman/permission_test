class PermissionGroupTeam < ApplicationRecord
  belongs_to :team
  belongs_to :permission_group
end
