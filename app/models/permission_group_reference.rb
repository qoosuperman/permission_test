class PermissionGroupReference < ApplicationRecord
  belongs_to :permission
  belongs_to :permission_group
end
